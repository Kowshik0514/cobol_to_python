IDENTIFICATION DIVISION.
PROGRAM-ID. 171A.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 A          PIC X.

PROCEDURE DIVISION.
  ACCEPT A.

  IF (A >= 'A' AND A <='Z')
    DISPLAY 'A'
  ELSE
    DISPLAY 'a'
  END-IF.

  STOP RUN.