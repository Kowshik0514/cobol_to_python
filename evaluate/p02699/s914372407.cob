IDENTIFICATION DIVISION.
PROGRAM-ID. 164A.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 INP        PIC X(10).
01 S          PIC 9(3).
01 W          PIC 9(3).
*>
PROCEDURE DIVISION.
  ACCEPT INP.
  UNSTRING INP DELIMITED BY ' '
      INTO S W.
*>
  IF (W >= S)
    DISPLAY 'unsafe'
  ELSE
    DISPLAY 'safe'
  END-IF.
*>
  STOP RUN.
