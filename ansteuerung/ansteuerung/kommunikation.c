/*
 * kommunikation.h
 *
 * Created: 05.09.2018 15:43:01
 * Author : Armin
 *
 *
 *Dieses Programm dient zur �bermittlung der Daten zwischen Akkumanagement und Motorcontroller
 *
 *	Dabei wird UART verwendet
 *	Timer 0 sorgt f�r die syncronisation der Daten�bertragung
 *	F�r Detail sihe Dokumentation
 *
 *
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <stdlib.h>
#include "lcd.h"
#include "kommunikation.h"
#include "datenverarbeitung.h"
#include "motoransteuerung.h"
#include "berechnung.h"


char start = 0;

char  bf=0;

volatile uint8_t zahler_uebertragung=0;

volatile unsigned char empfangs_daten[5];	//dynamischer Speicher der Akkudaten
volatile unsigned char akku_daten[5];		//statischer Speicher der Akkudaten
char overflow_counter=0;	//Z�hlt Overflows f�r Pause

volatile uint16_t niedrige_akku_voltage_array[5];
volatile uint8_t temperatur_array[5];
volatile uint16_t ges_volatage_array[5];

volatile uint16_t niedrige_akku_voltage=NENNZELLSPANNUNG;	//Akku Spannung	0-3650mV
volatile uint8_t temperatur=ZIMMERTEMERATUR;//Temperatur	0-60C
volatile uint16_t ges_volatage=NENNSPANNUNG;	//Nennspannung 48000

volatile uint8_t zahler_array=0;

char empfang_test;

char counter_falsch = 0;

volatile uint8_t akku_unterladen = 0;


void init_usart (void)
{  
	UBRR1H = (unsigned char)(UBRR_CALC>>8); //Baudrate einstellen  
	UBRR1L = (unsigned char)(UBRR_CALC);    
	UCSR1B = UCSR1B | (1<<RXEN1);	//Empfang ein
	UCSR1B = UCSR1B | (1<<RXCIE1);	//Empfang-Interruput ein
	UCSR1B = UCSR1B | (1<<TXEN1);	//Sender ein  
	
	UCSR1C = UCSR1C &~ (1<<UMSEL10);	//asynchr.
	UCSR1C = UCSR1C &~ (1<<UMSEL11);	
	
	UCSR1C = UCSR1C &~ (1<<UPM10);		//even parity
	UCSR1C = UCSR1C | (1<<UPM11);
	
	UCSR1C = UCSR1C &~ (1<<USBS1);		//1-Stop-Bit
	
	UCSR1C = UCSR1C | (1<<UCSZ10);		//8-Bit data
	UCSR1C = UCSR1C | (1<<UCSZ11);
	UCSR1B = UCSR1B &~ (1<<UCSZ12);
	
	UCSR1C = UCSR1C &~ (UCPOL1);		//muss low sein im asynchron mode
	
	
}
void init_transmission_timer(void)
{
	TCCR0A = TCCR0A &~ (1<<COM0A0);		//Normal Port Operations
	TCCR0A = TCCR0A &~ (1<<COM0A1);
	
	TCCR0A = TCCR0A &~ (1<<WGM00);		//Normal Mode
	TCCR0A = TCCR0A &~ (1<<WGM01);
	TCCR0B = TCCR0B &~ (1<<WGM02);
	
	TCCR0B = TCCR0B &~ (1<<CS00);		//Teiler 256 (16MHz / 256 = 16�s)
	TCCR0B = TCCR0B &~ (1<<CS01);
	TCCR0B = TCCR0B | (1<<CS02);
	
	OCR0A = 100;	//Compare bei 1,6ms	(16�s * 100 = 1,6ms)
	
	TIMSK0 = TIMSK0 | (1<<OCIE0A);		//Interrupt nach 1,6ms
	//TIMSK0 = TIMSK0 | (1<<TOIE0);		//Overflow Interrupt nach 4ms
	
}
void daten_aufteilen(void)
{
	
	temperatur_array[zahler_array] = akku_daten[0];					//Temperatur
	niedrige_akku_voltage_array[zahler_array] = akku_daten[1];					//Low-Spannung
	niedrige_akku_voltage_array[zahler_array] = niedrige_akku_voltage_array[zahler_array] | (akku_daten[2]<<8);		//HIGH Byte der Spannung
	ges_volatage_array[zahler_array] = akku_daten[3];
	ges_volatage_array[zahler_array] = ges_volatage_array[zahler_array] | (akku_daten[4]<<8);
	
	zahler_array++;
	
	if (zahler_array >= 5)
	{
		zahler_array=0;
	}

	//gechecked		
	
}
void kommunikations_daten_mitteln(void)
{	
	for(int k=0; k<5; k++)
	{
		temperatur= (temperatur+(temperatur_array[k]/5));
		niedrige_akku_voltage = (niedrige_akku_voltage+(niedrige_akku_voltage_array[k]/5));
		ges_volatage = (ges_volatage+(ges_volatage_array[k]/5));
	}
	
	if (niedrige_akku_voltage_array[zahler_array] == 2800)
	{
		//Debug
	}
	
}
void save_akku_daten(void)
{
		
	akku_daten[0] = empfangs_daten[0];		//Temperatur
	akku_daten[1] = empfangs_daten[1];		//Low-Spannung
	akku_daten[2] = empfangs_daten[2];		//High-Spannung
	akku_daten[3] = empfangs_daten[3];		//Low_Ges_Spannung
	akku_daten[4] = empfangs_daten[4];		//High_Ges_Spannung
	


}

uint16_t ges_spannung_uebertragung(void)
{
	if ((ges_volatage >= MINSPANNUNG) && (ges_volatage <= MAXSPANNUNG))
	{
		return ges_volatage;
	}
	else
	{
		return NENNSPANNUNG;
	}
	
	return ges_volatage;
}
uint16_t niedrigste_akku_voltage_uebertragung (void)
{
	if ((niedrige_akku_voltage >= MINZELLSPANNUNG) && (niedrige_akku_voltage <= MAXZELLSPANNUNG))
	{
		return niedrige_akku_voltage;
	}
	else
	{
		return NENNZELLSPANNUNG;
	}
	
}
uint8_t temperatur_uebertragung(void)
{
	if(temperatur <= MAXTEMPERATUR)
	{
		return temperatur;
	}
	else
	{
		return 20;
	}
	
	
}
void init_ext_int_kommunikation(void)
{
	
	EICRA = EICRA | (1<<ISC21);
	EICRA = EICRA &~ (1<<ISC20);	//falling edge
	
	EIMSK = EIMSK | (1<<INT2);		//enable ext_int2
}
uint8_t ext_int_kommunikation_abfrage(void)
{
	
	return akku_unterladen;
}
ISR(USART1_RX_vect)     //Interrupt f�r Empfang 
{  
	
		
	if((start == 1 && overflow_counter >= 5) || (zahler_uebertragung >= 1))			//Wenn nicht gerade in Daten ist && pause eingehalten wurde		//5*1,6ms = 8ms
	{
		//genaue 8ms k�nnen zum Problem werden
		
			overflow_counter = 0;		//Counter wird auf 0 gesetzt
			TCNT0 = 0;
		
			//while( !(UCSR1A & (1<<RXC1)) );   //warten bis Zeichen fertig empfangen
			empfangs_daten[zahler_uebertragung] = UDR1;		//Zeichen in Variable ablegen	//UDR1 -> 8 Bit daten 9.Bit w�re in UCSR1B			//Temperatur //LOW-Spannung //LOW-Spannung
			
		
			if (zahler_uebertragung == 4)
			{
				save_akku_daten();
			}		
		
			zahler_uebertragung++;
		
		}

}
ISR (TIMER0_COMPA_vect)
{
	TCNT0 = 0;
	start = 1;
	

	
	zahler_uebertragung = 0;
	
	
	overflow_counter++;		//Z�hlen der Overflows
	
	if(overflow_counter == 2)		//nach 3*1,6ms= 4,8ms werden Daten gespeichert
	{
		daten_aufteilen();
	}
	
	if (overflow_counter > 250)
	{
		overflow_counter = 250;
	}
	
}
ISR(INT2_vect) //Flanke low aktiv
{
	//Der Akku f�llt unter XXVolt deswegen muss abgeschalten werden

	if ((drehzahl_holen() >= 10))
	{
		akku_unterladen = 1;
	}

	
	

	
}