       IDENTIFICATION DIVISION.
       PROGRAM-ID. EVAL-EX2.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X PIC 9 VALUE 1.
       01 Y PIC 9 VALUE 2.

       PROCEDURE DIVISION.
       EVALUATE X ALSO Y
           WHEN 1 ALSO 2
               DISPLAY "X IS 1 AND Y IS 2"
           WHEN 3 ALSO 4
               DISPLAY "X IS 3 AND Y IS 4"
           WHEN OTHER
               DISPLAY "COMBINATION DOES NOT MATCH"
       END-EVALUATE.
       STOP RUN.
