IDENTIFICATION DIVISION.
PROGRAM-ID. PROGRAM_ID.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 ln         PIC X(15).
01 A          PIC 9(10).
01 B          PIC 9(10).
01 C          PIC 9(10).
01 D          PIC 9(10).
01 TK         PIC 9(10).
01 AO         PIC 9(10).

PROCEDURE DIVISION.
  ACCEPT ln.
  UNSTRING ln DELIMITED BY SPACE INTO A B C D.
  COMPUTE TK = (C + B - 1) / B
  COMPUTE AO = (A + D - 1) / D
  IF TK <= AO
    DISPLAY "Yes"
  ELSE
    DISPLAY "No"
  END-IF.
  STOP RUN.
