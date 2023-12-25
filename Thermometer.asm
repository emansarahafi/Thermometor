
_SSD_data:

;Thermometer.c,17 :: 		void SSD_data(char place_value){
;Thermometer.c,18 :: 		switch (place_value) {             //write number into the PORTD
	GOTO        L_SSD_data0
;Thermometer.c,19 :: 		case 0: PORTD = 0x3F;  break;      //number 0 = 0x3F(common cathode SSD)
L_SSD_data2:
	MOVLW       63
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,20 :: 		case 1: PORTD = 0x06;  break;      //likewise use mikroC seven segment editor to find hex value
L_SSD_data3:
	MOVLW       6
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,21 :: 		case 2: PORTD = 0x5B;  break;
L_SSD_data4:
	MOVLW       91
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,22 :: 		case 3: PORTD = 0x4F;  break;
L_SSD_data5:
	MOVLW       79
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,23 :: 		case 4: PORTD = 0x66;  break;
L_SSD_data6:
	MOVLW       102
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,24 :: 		case 5: PORTD = 0x6D;  break;
L_SSD_data7:
	MOVLW       109
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,25 :: 		case 6: PORTD = 0x7C;  break;
L_SSD_data8:
	MOVLW       124
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,26 :: 		case 7: PORTD = 0x07;  break;
L_SSD_data9:
	MOVLW       7
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,27 :: 		case 8: PORTD = 0x7F;  break;
L_SSD_data10:
	MOVLW       127
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,28 :: 		case 9: PORTD = 0x67;  break;
L_SSD_data11:
	MOVLW       103
	MOVWF       PORTD+0 
	GOTO        L_SSD_data1
;Thermometer.c,29 :: 		}
L_SSD_data0:
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data2
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data3
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data4
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data5
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data6
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data7
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data8
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data9
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data10
	MOVF        FARG_SSD_data_place_value+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_SSD_data11
L_SSD_data1:
;Thermometer.c,30 :: 		}
L_end_SSD_data:
	RETURN      0
; end of _SSD_data

_main:

;Thermometer.c,32 :: 		void main() {
;Thermometer.c,33 :: 		PORTA = 0x00;   //clear previous portA data
	CLRF        PORTA+0 
;Thermometer.c,34 :: 		PORTB = 0x00;   //      "        portB "
	CLRF        PORTB+0 
;Thermometer.c,35 :: 		PORTD = 0x00;   //      "        PORTD "
	CLRF        PORTD+0 
;Thermometer.c,36 :: 		PORTC = 0x00;   //      "        portC  "
	CLRF        PORTC+0 
;Thermometer.c,38 :: 		TRISB.RB0 = 1;     //portB pin0 input(Temperature sensor)
	BSF         TRISB+0, 0 
;Thermometer.c,39 :: 		TRISA = 0x00;      //portB output(Display data)
	CLRF        TRISA+0 
;Thermometer.c,40 :: 		TRISD = 0x00;      //portD output(Display data)
	CLRF        TRISD+0 
;Thermometer.c,41 :: 		TRISC.RC2 = 0;         //buzzer output
	BCF         TRISC+0, 2 
;Thermometer.c,43 :: 		ANSELB.RB0 = 1;    //portB pin0 analog
	BSF         ANSELB+0, 0 
;Thermometer.c,44 :: 		ANSELA = 0x00;     //portA digital
	CLRF        ANSELA+0 
;Thermometer.c,45 :: 		ANSELD = 0x00;     //portD digital
	CLRF        ANSELD+0 
;Thermometer.c,46 :: 		ANSELC = 0x00;     //PORTC digital
	CLRF        ANSELC+0 
;Thermometer.c,48 :: 		ADC_Init();  // Initialize ADC module with default settings
	CALL        _ADC_Init+0, 0
;Thermometer.c,51 :: 		while(1){
L_main12:
;Thermometer.c,52 :: 		temp_res = ADC_Read(12);                  // Get 10-bit results of AD conversion
	MOVLW       12
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_res+0 
	MOVF        R1, 0 
	MOVWF       _temp_res+1 
;Thermometer.c,53 :: 		temp_flt = temp_res / 1024.0 * 500.0;     //map ADC result with Temperature
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_flt+0 
	MOVF        R1, 0 
	MOVWF       _temp_flt+1 
	MOVF        R2, 0 
	MOVWF       _temp_flt+2 
	MOVF        R3, 0 
	MOVWF       _temp_flt+3 
;Thermometer.c,56 :: 		if(temp_flt > 40.0){   //if temperature is above 40C
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       32
	MOVWF       R2 
	MOVLW       132
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
;Thermometer.c,57 :: 		PORTC.RC2 = 1;   //buzzer ON
	BSF         PORTC+0, 2 
;Thermometer.c,58 :: 		}else{
	GOTO        L_main15
L_main14:
;Thermometer.c,59 :: 		PORTC.RC2 = 0;             //if not buzzer OFF
	BCF         PORTC+0, 2 
;Thermometer.c,60 :: 		}
L_main15:
;Thermometer.c,62 :: 		temp_flt = temp_flt * 10;    //shift decimal place to left once (Eg: 132.5 => 1325.)
	MOVF        _temp_flt+0, 0 
	MOVWF       R0 
	MOVF        _temp_flt+1, 0 
	MOVWF       R1 
	MOVF        _temp_flt+2, 0 
	MOVWF       R2 
	MOVF        _temp_flt+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+6 
	MOVF        R1, 0 
	MOVWF       FLOC__main+7 
	MOVF        R2, 0 
	MOVWF       FLOC__main+8 
	MOVF        R3, 0 
	MOVWF       FLOC__main+9 
	MOVF        FLOC__main+6, 0 
	MOVWF       _temp_flt+0 
	MOVF        FLOC__main+7, 0 
	MOVWF       _temp_flt+1 
	MOVF        FLOC__main+8, 0 
	MOVWF       _temp_flt+2 
	MOVF        FLOC__main+9, 0 
	MOVWF       _temp_flt+3 
;Thermometer.c,66 :: 		temp_dec_100th_place = temp_flt / 1000;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	MOVF        FLOC__main+6, 0 
	MOVWF       R0 
	MOVF        FLOC__main+7, 0 
	MOVWF       R1 
	MOVF        FLOC__main+8, 0 
	MOVWF       R2 
	MOVF        FLOC__main+9, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+5 
	MOVF        FLOC__main+5, 0 
	MOVWF       _temp_dec_100th_place+0 
;Thermometer.c,67 :: 		temp_dec_10th_place = temp_flt / 100 - (temp_dec_100th_place * 10);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        FLOC__main+6, 0 
	MOVWF       R0 
	MOVF        FLOC__main+7, 0 
	MOVWF       R1 
	MOVF        FLOC__main+8, 0 
	MOVWF       R2 
	MOVF        FLOC__main+9, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVLW       10
	MULWF       FLOC__main+5 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+4 
	MOVF        FLOC__main+4, 0 
	MOVWF       _temp_dec_10th_place+0 
;Thermometer.c,68 :: 		temp_dec_1st_place = temp_flt / 10 - (temp_dec_100th_place * 100 + temp_dec_10th_place * 10);
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FLOC__main+6, 0 
	MOVWF       R0 
	MOVF        FLOC__main+7, 0 
	MOVWF       R1 
	MOVF        FLOC__main+8, 0 
	MOVWF       R2 
	MOVF        FLOC__main+9, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVLW       100
	MULWF       FLOC__main+5 
	MOVF        PRODL+0, 0 
	MOVWF       R2 
	MOVF        PRODH+0, 0 
	MOVWF       R3 
	MOVLW       10
	MULWF       FLOC__main+4 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R3, 0 
	ADDWFC      R1, 1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        FLOC__main+0, 0 
	MOVWF       _temp_dec_1st_place+0 
;Thermometer.c,69 :: 		temp_dec_place = temp_flt / 1 - (temp_dec_100th_place * 1000 + temp_dec_10th_place * 100 + temp_dec_1st_place * 10);
	MOVF        FLOC__main+5, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	CALL        _Mul_16X16_U+0, 0
	MOVLW       100
	MULWF       FLOC__main+4 
	MOVF        PRODL+0, 0 
	MOVWF       R2 
	MOVF        PRODH+0, 0 
	MOVWF       R3 
	MOVF        R0, 0 
	ADDWF       R2, 1 
	MOVF        R1, 0 
	ADDWFC      R3, 1 
	MOVLW       10
	MULWF       FLOC__main+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R3, 0 
	ADDWFC      R1, 1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+6, 0 
	MOVWF       R0 
	MOVF        FLOC__main+7, 0 
	MOVWF       R1 
	MOVF        FLOC__main+8, 0 
	MOVWF       R2 
	MOVF        FLOC__main+9, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       _temp_dec_place+0 
;Thermometer.c,71 :: 		LATA = 0x07;                    //set 0 to appropriate SSD
	MOVLW       7
	MOVWF       LATA+0 
;Thermometer.c,73 :: 		SSD_data(temp_dec_100th_place); //write decode data into PORTD(100th place number)
	MOVF        FLOC__main+5, 0 
	MOVWF       FARG_SSD_data_place_value+0 
	CALL        _SSD_data+0, 0
;Thermometer.c,74 :: 		delay_ms(10);                   //10 miliseconds delay
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
;Thermometer.c,76 :: 		LATA = 0x0B;                    //same as above
	MOVLW       11
	MOVWF       LATA+0 
;Thermometer.c,77 :: 		SSD_data(temp_dec_10th_place);  //write 10th place value to portD
	MOVF        _temp_dec_10th_place+0, 0 
	MOVWF       FARG_SSD_data_place_value+0 
	CALL        _SSD_data+0, 0
;Thermometer.c,78 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
;Thermometer.c,80 :: 		LATA = 0x0D;
	MOVLW       13
	MOVWF       LATA+0 
;Thermometer.c,81 :: 		SSD_data(temp_dec_1st_place);   //1st place
	MOVF        _temp_dec_1st_place+0, 0 
	MOVWF       FARG_SSD_data_place_value+0 
	CALL        _SSD_data+0, 0
;Thermometer.c,82 :: 		PORTD = PORTD + 0x80;           //show decimal point in 3rd SSD(seven segment display)
	MOVLW       128
	ADDWF       PORTD+0, 1 
;Thermometer.c,83 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
;Thermometer.c,85 :: 		LATA = 0x0E;                    //set SSD 4
	MOVLW       14
	MOVWF       LATA+0 
;Thermometer.c,86 :: 		SSD_data(temp_dec_place);       //write floating point number into the PORTD
	MOVF        _temp_dec_place+0, 0 
	MOVWF       FARG_SSD_data_place_value+0 
	CALL        _SSD_data+0, 0
;Thermometer.c,87 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	NOP
;Thermometer.c,88 :: 		}
	GOTO        L_main12
;Thermometer.c,90 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
