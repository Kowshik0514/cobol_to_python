 IDENTIFICATION DIVISION.
 PROGRAM-ID. TEST120.
      
 DATA DIVISION.
 WORKING-STORAGE SECTION.
    
 01 B     PIC X(1).
      
 PROCEDURE DIVISION.
  ACCEPT B.
 
  EVALUATE TRUE
      WHEN B = 'A'
        DISPLAY 'T'
      WHEN B = 'T'
        DISPLAY 'A'
      WHEN B = 'C'
        DISPLAY 'G'
      WHEN B = 'G'
        DISPLAY 'C'
      WHEN OTHER
        CONTINUE
   END-EVALUATE.
 
   STOP RUN.