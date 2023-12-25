#line 1 "C:/Users/emans/Desktop/Thermometer/Thermometer.c"

unsigned int temp_res;
float temp_flt;



unsigned char temp_dec_100th_place;
unsigned char temp_dec_10th_place;
unsigned char temp_dec_1st_place;
unsigned char temp_dec_place;






 void SSD_data(char place_value){
 switch (place_value) {
 case 0: PORTD = 0x3F; break;
 case 1: PORTD = 0x06; break;
 case 2: PORTD = 0x5B; break;
 case 3: PORTD = 0x4F; break;
 case 4: PORTD = 0x66; break;
 case 5: PORTD = 0x6D; break;
 case 6: PORTD = 0x7C; break;
 case 7: PORTD = 0x07; break;
 case 8: PORTD = 0x7F; break;
 case 9: PORTD = 0x67; break;
 }
}

void main() {
 PORTA = 0x00;
 PORTB = 0x00;
 PORTD = 0x00;
 PORTC = 0x00;

 TRISB.RB0 = 1;
 TRISA = 0x00;
 TRISD = 0x00;
 TRISC.RC2 = 0;

 ANSELB.RB0 = 1;
 ANSELA = 0x00;
 ANSELD = 0x00;
 ANSELC = 0x00;

 ADC_Init();


 while(1){
 temp_res = ADC_Read(12);
 temp_flt = temp_res / 1024.0 * 500.0;


 if(temp_flt > 40.0){
 PORTC.RC2 = 1;
 }else{
 PORTC.RC2 = 0;
 }

 temp_flt = temp_flt * 10;



 temp_dec_100th_place = temp_flt / 1000;
 temp_dec_10th_place = temp_flt / 100 - (temp_dec_100th_place * 10);
 temp_dec_1st_place = temp_flt / 10 - (temp_dec_100th_place * 100 + temp_dec_10th_place * 10);
 temp_dec_place = temp_flt / 1 - (temp_dec_100th_place * 1000 + temp_dec_10th_place * 100 + temp_dec_1st_place * 10);

 LATA = 0x07;

 SSD_data(temp_dec_100th_place);
 delay_ms(10);

 LATA = 0x0B;
 SSD_data(temp_dec_10th_place);
 delay_ms(10);

 LATA = 0x0D;
 SSD_data(temp_dec_1st_place);
 PORTD = PORTD + 0x80;
 delay_ms(10);

 LATA = 0x0E;
 SSD_data(temp_dec_place);
 delay_ms(10);
 }

}
