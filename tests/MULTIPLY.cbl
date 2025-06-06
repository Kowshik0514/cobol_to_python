       IDENTIFICATION DIVISION.
       PROGRAM-ID. MULTIPLY-EXAMPLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       1 A PIC 9(4) VALUE 10.
       1 B PIC 9(4) VALUE 2000.
       1 C PIC 9(4) VALUE 0.
       1 D PIC 9(4) VALUE 0.
       1 E PIC 9(4) VALUE 0.
       1 F PIC 9(4) VALUE 0.
       1 G PIC 9(4) VALUE 0.
       01 GROUP-1.
          05 NUM1 .
                10 NUM3  PIC 99V99 VALUE 20.
          05 NUM2 PIC 9(4) VALUE 20.
       01 GROUP-2.
          05 NUM1.
                10 NUM5 PIC 9(5) VALUE 20.
          05 NUM2 PIC 9(4) VALUE 40.
       01  NUM6          PIC 99V99 VALUE 15.55.
       01  NUM7          PIC 99V99 VALUE 10.49.
       01  ANS        PIC 999V99.
       PROCEDURE DIVISION.
           DISPLAY 'Initial Values: A=' A ' B=' B ' C=' C ' D=' D ' E=' 
           E ' F=' F.
           
           MULTIPLY A BY B .
           DISPLAY 'After MULTIPLY A BY B: A=' A ' B=' B.
           
           MULTIPLY 2 BY A ROUNDED B.
           DISPLAY 'After MULTIPLY 2 BY A B: A=' A ' B=' B.
           
           MULTIPLY 3 BY A GIVING C.
           DISPLAY 'After MULTIPLY 3 BY A GIVING C: C=' C.
           
           MULTIPLY 4 BY A GIVING D ROUNDED.
           DISPLAY 'After MULTIPLY 4 BY A GIVING D ROUNDED: D=' D.
           
           MULTIPLY A BY 2 GIVING E ROUNDED F ROUNDED.
           DISPLAY 'After MULTIPLY A BY 2 GIVING E F: E=' E ' F=' F.
           
           MULTIPLY NUM5 OF NUM1 OF GROUP-2  BY NUM3 ROUNDED.
           MULTIPLY NUM6 BY NUM7 GIVING ANS NUM6 ROUNDED.
           DISPLAY 'NUM6: ' NUM6.
           DISPLAY 'NUM7: ' NUM7.
           DISPLAY 'Result of multiplication (rounded): ' ANS.
       
           STOP RUN.
