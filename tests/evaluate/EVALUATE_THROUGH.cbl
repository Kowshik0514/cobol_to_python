       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL-EX3.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X PIC 9 VALUE 4.

       PROCEDURE DIVISION.
       EVALUATE X
           WHEN 1 THROUGH 5
               DISPLAY "X IS BETWEEN 1 AND 5"
           WHEN 6
               DISPLAY "X IS 6"
           WHEN OTHER
               DISPLAY "X IS GREATER THAN 6"
       END-EVALUATE.
       STOP RUN.
