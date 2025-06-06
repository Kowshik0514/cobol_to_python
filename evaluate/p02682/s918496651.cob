IDENTIFICATION DIVISION.
PROGRAM-ID. PROGRAM_ID.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 ln             PIC X(43).
01 A              PIC 9(10).
01 B              PIC 9(10).
01 C              PIC 9(10).
01 K              PIC 9(10).
01 ans            PIC S9(10).
01 zs             PIC X(10).

PROCEDURE DIVISION.
  ACCEPT ln.
  UNSTRING ln DELIMITED BY SPACE INTO A B C K.
  IF K <= A
      COMPUTE ans = K
  ELSE
      IF K <= A + B
          COMPUTE ans = A
      ELSE
          COMPUTE ans = A - (K - A - B)
      END-IF
  END-IF.
  MOVE ans TO zs.
  IF ZERO <= ans 
      DISPLAY zs
  ELSE
      DISPLAY "-" zs
  END-IF.
  STOP RUN.
