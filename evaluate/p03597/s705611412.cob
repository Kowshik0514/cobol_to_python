       IDENTIFICATION DIVISION.
       PROGRAM-ID. test1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 99999.
       01 A PIC 99999.
       01 RE PIC ZZZZ9.
       PROCEDURE DIVISION.
       MAIN.
       	ACCEPT N.
      	ACCEPT A.
      	COMPUTE N=N*N.
      	SUBTRACT A FROM N.
      	MOVE N TO RE.
      	DISPLAY RE.
        STOP RUN.
