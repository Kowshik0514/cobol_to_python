IDENTIFICATION DIVISION.
PROGRAM-ID. 158A.
 
DATA DIVISION.
WORKING-STORAGE SECTION.
01 INP.
   03 S1       PIC X.
   03 S2       PIC X.
   03 S3       PIC X.
 
PROCEDURE DIVISION.
MAIN-001.
  ACCEPT INP.
 
  IF (S1 = S2) AND (S1 = S3)
    DISPLAY 'No'
  ELSE
    DISPLAY 'Yes'
  END-IF.
MAIN-EXIT.
  STOP RUN.