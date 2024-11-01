IDENTIFICATION DIVISION.
PROGRAM-ID. PROGRAM_ID.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 LN           PIC X(13).
01 N            PIC 9(10).
01 K            PIC 9(2).
01 cnt          PIC 9(2).
01 ans          PIC X(2).

PROCEDURE DIVISION.
  ACCEPT LN.
  UNSTRING LN DELIMITED BY SPACE INTO N K.
  MOVE 1 TO cnt.
  PERFORM UNTIL N < K ** cnt
      ADD 1 TO cnt
  END-PERFORM.
  MOVE cnt TO ans.
  DISPLAY ans.
  STOP RUN.