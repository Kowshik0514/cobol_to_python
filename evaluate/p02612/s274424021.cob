IDENTIFICATION DIVISION.
PROGRAM-ID. 173A.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 N          PIC 9(05).
01 S          PIC 9(04).
01 OT         PIC 9(04).
01 OUT        PIC X(3).

PROCEDURE DIVISION.
  ACCEPT N.

  DIVIDE N BY 1000 GIVING S REMAINDER OT.
  COMPUTE OT = 1000 - OT
  IF OT = 1000
    MOVE 0 TO OT
  END-IF.

  MOVE OT TO OUT.
  DISPLAY OUT.
  STOP RUN.
