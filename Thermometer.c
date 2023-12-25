//SSD => seven segment display
unsigned int temp_res;                  //variable for save ADC results(ADC = analog to digital converter)
float temp_flt;                         //variable for save temparature
//unsigned char i = 0;
//unsigned char segment_counter = 0x01;

unsigned char temp_dec_100th_place;     //variable for save 100th place of the temparature value
unsigned char temp_dec_10th_place;      //         "   "    10th  "     "  "   "           "
unsigned char temp_dec_1st_place;       //         "   "    1st     "     "  "   "           "
unsigned char temp_dec_place;           //         "   "    decimal  "     "  "   "           "
                                        //Eg: 138.5
                                        //100th place = 1
                                        //10th place = 3
                                        //1st place = 8
                                        //decimal place(floating point) = 5
                                        
 void SSD_data(char place_value){
     switch (place_value) {             //write number into the PORTD
     case 0: PORTD = 0x3F;  break;      //number 0 = 0x3F(common cathode SSD)
     case 1: PORTD = 0x06;  break;      //likewise use mikroC seven segment editor to find hex value
     case 2: PORTD = 0x5B;  break;
     case 3: PORTD = 0x4F;  break;
     case 4: PORTD = 0x66;  break;
     case 5: PORTD = 0x6D;  break;
     case 6: PORTD = 0x7C;  break;
     case 7: PORTD = 0x07;  break;
     case 8: PORTD = 0x7F;  break;
     case 9: PORTD = 0x67;  break;
  }
}

void main() {
     PORTA = 0x00;   //clear previous portA data
     PORTB = 0x00;   //      "        portB "
     PORTD = 0x00;   //      "        PORTD "
     PORTC = 0x00;   //      "        portC  "
     
     TRISB.RB0 = 1;     //portB pin0 input(Temperature sensor)
     TRISA = 0x00;      //portB output(Display data)
     TRISD = 0x00;      //portD output(Display data)
     TRISC.RC2 = 0;         //buzzer output
     
     ANSELB.RB0 = 1;    //portB pin0 analog
     ANSELA = 0x00;     //portA digital
     ANSELD = 0x00;     //portD digital
     ANSELC = 0x00;     //PORTC digital
     
     ADC_Init();  // Initialize ADC module with default settings


     while(1){
              temp_res = ADC_Read(12);                  // Get 10-bit results of AD conversion
              temp_flt = temp_res / 1024.0 * 500.0;     //map ADC result with Temperature
                                                        //save Temperature value into temp_flt variable
                                                        
              if(temp_flt > 40.0){   //if temperature is above 40C
                                     PORTC.RC2 = 1;   //buzzer ON
              }else{
                    PORTC.RC2 = 0;             //if not buzzer OFF
              }
              
              temp_flt = temp_flt * 10;    //shift decimal place to left once (Eg: 132.5 => 1325.)
                                           //then it is easy to extract decimal place number
              
              //extract place number one by one and save into particular variable
              temp_dec_100th_place = temp_flt / 1000;
              temp_dec_10th_place = temp_flt / 100 - (temp_dec_100th_place * 10);
              temp_dec_1st_place = temp_flt / 10 - (temp_dec_100th_place * 100 + temp_dec_10th_place * 10);
              temp_dec_place = temp_flt / 1 - (temp_dec_100th_place * 1000 + temp_dec_10th_place * 100 + temp_dec_1st_place * 10);
              
              LATA = 0x07;                    //set 0 to appropriate SSD
              //call SSD_data function above
              SSD_data(temp_dec_100th_place); //write decode data into PORTD(100th place number)
              delay_ms(10);                   //10 miliseconds delay
              
              LATA = 0x0B;                    //same as above
              SSD_data(temp_dec_10th_place);  //write 10th place value to portD
              delay_ms(10);
              
              LATA = 0x0D;
              SSD_data(temp_dec_1st_place);   //1st place
              PORTD = PORTD + 0x80;           //show decimal point in 3rd SSD(seven segment display)
              delay_ms(10);
              
              LATA = 0x0E;                    //set SSD 4
              SSD_data(temp_dec_place);       //write floating point number into the PORTD
              delay_ms(10);
     }

}



