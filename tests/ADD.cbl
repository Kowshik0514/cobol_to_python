       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD-EXAMPLE.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 A PIC 9(4) VALUE 1000.
       77 B PIC 9(4) VALUE 2000.
       77 C PIC 9(4) VALUE 0000.
       77 D PIC 9(4) VALUE 0000.
       77 E PIC 9(4) VALUE 0000.
       77 F PIC X(4) VALUE "ABCD".
       01 GROUP-1.
          05 NUM1 PIC 9(4) VALUE 10.
          05 NUM2 PIC 9(4) VALUE 20.
       01 GROUP-2.
          05 NUM1 PIC 9(4) VALUE 30.
          05 NUM2 PIC 9(4) VALUE 40.
       
       PROCEDURE DIVISION.
           ADD A TO B.
           DISPLAY 'A + B = ' B.
           
           ADD A B 50 TO C E.
           DISPLAY 'A + B + C = ' C E.
           
           ADD A C TO B GIVING D E.
           DISPLAY 'A + B giving D = ' D E.
           
           ADD 50 TO E.
           DISPLAY '50 + E = ' E.

           SUBTRACT A B FROM C GIVING D E
           DISPLAY  D E.
           
           ADD CORRESPONDING GROUP-1 TO GROUP-2.
           DISPLAY 'NUM1 + NUM1 = ' NUM1 OF GROUP-2.
           DISPLAY 'NUM2 + NUM2 = ' NUM2 OF GROUP-2.
           
           STOP RUN.
       