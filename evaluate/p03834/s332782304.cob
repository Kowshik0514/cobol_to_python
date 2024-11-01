      IDENTIFICATION DIVISION.
      PROGRAM-ID. 051A.
      DATA DIVISION.
      WORKING-STORAGE SECTION.
      01 INP PIC X(20).
      01 S.
      	03 WK-S PIC X(1) OCCURS 19 TIMES.
      
      01 IDX PIC 9(2).
      
      PROCEDURE DIVISION.
      ACCEPT INP.
      MOVE INP TO S.

      PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 19
      	IF WK-S(IDX) = ","
      		MOVE " " TO WK-S(IDX)
      	ELSE
      		CONTINUE
        END-IF
      END-PERFORM.

      DISPLAY S.
      STOP RUN.