IDENTIFICATION DIVISION.
PROGRAM-ID. SORTNUM.

DATA DIVISION.
    WORKING-STORAGE SECTION.
      
      01 X PIC 9.

PROCEDURE DIVISION.
    MAIN .
      
      ACCEPT X.
      
      IF X = 0 THEN
      	DISPLAY 1
      ELSE
      	DISPLAY 0
      END-IF.


    STOP RUN.
