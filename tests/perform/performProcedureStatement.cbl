       IDENTIFICATION DIVISION.
       PROGRAM-ID. ProcedureRangePerformExample.
       PROCEDURE DIVISION.
           PERFORM PROCEDURE-1 THRU PROCEDURE-3.
           STOP RUN.
       PROCEDURE-1.
           DISPLAY 'This is PROCEDURE-1'.
           EXIT.
       PROCEDURE-2.
           DISPLAY 'This is PROCEDURE-2'.
           STOP RUN.
           EXIT.
       PROCEDURE-3.
           DISPLAY 'This is PROCEDURE-3'.
           EXIT.