

#define BAUD  9600UL		//gew�nschte Baudrate
#define UBRR_CALC (F_CPU/16UL/BAUD-1)  //Baudrtate aus Takt berechnen

#define NENNSPANNUNG 48000
#define MAXSPANNUNG 56000
#define MINSPANNUNG 40000

#define NENNZELLSPANNUNG 3300
#define MINZELLSPANNUNG 2800
#define MAXZELLSPANNUNG 3800

#define MAXTEMPERATUR 60
#define ZIMMERTEMERATUR 20


void init_usart (void);
void init_transmission_timer(void);
void save_akku_daten(void);
void daten_aufteilen(void);

void init_ext_int_kommunikation(void);
uint8_t ext_int_kommunikation_abfrage(void);

void kommunikations_daten_mitteln(void);


uint16_t ges_spannung_uebertragung(void);
uint16_t niedrigste_akku_voltage_uebertragung (void);
uint8_t temperatur_uebertragung(void);

