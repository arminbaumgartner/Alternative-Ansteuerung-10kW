/*
 * ansteuerung.c
 *
 * Created: 05.09.2018 15:43:01
 * Author : armin
 *
 *
 *Dieses Programm dient zur Ansteuersoftware des BLDC
 *
 *
 *
 *
 *
 *
 *
 */ 


#include <avr/io.h>
#include <avr/interrupt.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "main.h"

#include "berechnung.h"
#include "motoransteuerung.h"
#include "lcd.h"
#include <util/delay.h>
#include "kommunikation.h"
#include "datenverarbeitung.h"

volatile char zeitlicher_ablauf=0;


int main(void)
{

	uint16_t ges_spannung_main;
	uint8_t ladestand_test = 0;

	
	CLKPR = 0x80;						//Clock prescaler 16MHz
	CLKPR = 0x00;

	MCUCR = MCUCR | (1<<JTD);			//JTD Schnittstelle ausschalten f�r PWM6 Mode
	MCUCR = MCUCR | (1<<JTD);
	
	//MOTOR PWM PINS
	DDRC = DDRC | (1<<DDC7);	//OC4A -Pin (PC7) als OUTPUT	//PHASE A
	DDRC = DDRC | (1<<DDC6);	//OC4A#-Pin (PC6) als OUTPUT	//PHASE A
	DDRB = DDRB | (1<<DDB6);	//OC4B -Pin (PB6) als OUTPUT	//PHASE B
	DDRB = DDRB | (1<<DDB5);	//OC4B#-Pin (PB5) als OUTPUT	//PHASE B
	DDRD = DDRD | (1<<DDD7);	//OC4D -Pin (PD7) als OUTPUT	//PHASE C
	DDRD = DDRD | (1<<DDD6);	//OC4D#-Pin (PD6) als OUTPUT	//PHASE C
	
	//HALL SENSORS PINS
	DDRB = DDRB &~ (1<<DDB1);	//PCINT1-Pin (PB1) als INPUT	//HALL A
	DDRB = DDRB &~ (1<<DDB2);	//PCINT2-Pin (PB2) als INPUT	//HALL B
	DDRB = DDRB &~ (1<<DDB3);	//PCINT3-Pin (PB3) als INPUT	//HALL C
	PORTB = PORTB &~ (1<<PORTB1);	//PULL-UP aus
	PORTB = PORTB &~ (1<<PORTB2);	//PULL-UP aus
	PORTB = PORTB &~ (1<<PORTB3);	//PULL-UP aus

	//Vorw�rts - R�ckw�rts Schalter
	DDRB = DDRB &~ (1<<DDB4);	//PB4 als INPUT		//vorw�rts / r�ckw�rst Schalter
	PORTB = PORTB | (1<<PORTB4);	//PULL-UP
	
	//Shutdown Pin	
	DDRE = DDRE | (1<<DDE6);	//Shutdown-Pin (PE6) als OUTPUT
	PORTE = PORTE &~ (1<<PORTE6);	//Shutdown-Pin auf HIGH -> da er LOW-AKTIVE ist 
	
	//ADC
	DDRF = DDRF &~ (1<<DDF0);	//ADC0-Pin (PF0) als INPUT
	
	//LCD - Pins
	DDRB = DDRB | (1<<PORTB0);		//RS (PB0) als OUTPUT
	DDRF = DDRF | (1<<PORTF1);		//Enable (PF1) als OUTPUT
	DDRF = DDRF | (1<<PORTF7);		//LCD-DB7 (PF7 �C) als OUTPUT
	DDRF = DDRF | (1<<PORTF6);		//LCD-DB6 (PF6 �C) als OUTPUT
	DDRF = DDRF | (1<<PORTF5);		//LCD-DB5 (PF5 �C) als OUTPUT
	DDRF = DDRF | (1<<PORTF4);		//LCD-DB4 (PF4 �C) als OUTPUT
	
	//UART
	//PORTD = PORTD | (1<<PORTD2);		// pull up um keine st�rungen einzufangen
	
	//MOSFET f�r Relai
	DDRD = DDRD | (1<<DDD4);	//MOSFET f�r Railai	
	
	//Modi Schalter
	DDRD = DDRD &~ (1<<DDD0);
	PORTD = PORTD | (1<<PORTD0);		//Pull-up
	
	//Kommunikation �ber EXT-Int
	DDRD = DDRD &~ (1<<DDD2);		//Eingang INT2
	PORTD = PORTD | (1<<PORTD2);	//PULL-UP
	
	
	//Debug-Pins
	DDRB = DDRB | (1<<DDB7);
	
	
	Init_Pinchange();	//Initialisierung Hallsensoren
	
	Init_PWM();			//Initialisierung 6-fach PWM signale
	
	Init_ADC();			//Initialisierung ADC
	
	Init_Timer1();		//Initialisierung Berechnungen Geschw. Drehzahl
	
	//init_usart();				//Initialisierung von Kommunikationsschnittstelle UART
	//init_transmission_timer();	//Initaliesierung von Timer0 f�r UART
	
	
	init_timer_zeitlicher_ablauf();
	
	LCD_init();			//Initialisierung  LCD
	LCD_cmd(0x0C);		//Display ON, Cursor OFF, Blinking OFF 
	
	Hallsensoren_abfragen();
	
	init_ext_int_kommunikation();	//Initialiesierung des externen interrupt f�r akku�berwachung
		
	sei();
	
	LCD_Display();		//Drezahl, Geschwindkeit schreiben
	
	
	_delay_ms(2000);
	
	PORTE = PORTE &~ (1<<PORTE6);	//Shutdown-Pin auf HIGH -> da er LOW-AKTIVE ist   //muss noch ge�ndert werden!!!!!
	
	//F�r Anfangsausgabe
	preset_drehzahl_gesch();
	
	zeitlicher_ablauf=0;
	
    while (1) 
    {	
		kommunikations_daten_mitteln();
						
		if(zeitlicher_ablauf >= 10)
		{
		
			
			ges_spannung_main=ges_spannung_uebertragung();

			geschwindigkeit_berechnung();
			ladestand_test = akku_ladestand(ges_spannung_main);
			ladestand_ausgabe(ladestand_test);
			
			

			//dtostrf((float)drehzahl, 5, 0, ausgabe);
			drehzahl_ausgabe();	
		
			//dtostrf((float)geschwindigkeit, 5, 0, ausgabe);
			geschwindigkeits_ausgabe();
			
		
			zeitlicher_ablauf=0;
		
			}
		
    }
	
}

void init_timer_zeitlicher_ablauf(void)
{
	
	
	TCCR3B = TCCR3B | (1<<CS10);		// Teiler 256 (16MHz / 64 = 4�s)
	TCCR3B = TCCR3B | (1<<CS11);		//Kleiner Schritt 4�s		(1*4�s)
	TCCR3B = TCCR3B &~ (1<<CS12);		//Gr��ter Schritt 262ms	(65535*4�s)
	
	TIMSK3 = TIMSK3 | (1<<OCIE3A);		//OC3A interrupt
	
	OCR3A = 2500;		//25000*4�s = 100ms
	//OCR3B = 400;		//400*4� = 1,6ms
	//OCR3AH =  97;
	//OCR3AL = 168;
	
}

ISR(TIMER3_COMPA_vect)
{
	TCNT3 = 0;
	
	
	if(zeitlicher_ablauf >= 25)
	{
		
		zeitlicher_ablauf=0;
	}
	
	zeitlicher_ablauf++;
	

}

	
