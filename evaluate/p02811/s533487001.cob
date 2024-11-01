IDENTIFICATION DIVISION.
PROGRAM-ID. PROGRAM_ID.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LN             PIC X(10).
01 K              PIC 9(3).
01 X              PIC 9(6).

PROCEDURE DIVISION.
  ACCEPT LN.
  UNSTRING LN DELIMITED BY SPACE INTO K X.
  IF X <= 500 * K
      DISPLAY "Yes"
  ELSE
      DISPLAY "No"
  END-IF.
  STOP RUN.
