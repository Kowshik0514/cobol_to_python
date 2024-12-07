      IDENTIFICATION DIVISION.
      PROGRAM-ID. 055A.
      DATA DIVISION.
      WORKING-STORAGE SECTION.
      01 N PIC 9(3).
      01 X PIC 9(5).
      01 Y PIC 9(5).
      01 SHO PIC 9(2).
      01 AMA PIC 9(2).
      01 ANS PIC 9(5).
      01 ANSS PIC X(5).
      
      PROCEDURE DIVISION.
      ACCEPT N.
      COMPUTE X = 800 * N.
      DIVIDE N BY 15 GIVING SHO REMAINDER AMA.
      COMPUTE Y = 200 * SHO.
      COMPUTE ANS = X - Y.
      MOVE ANS TO ANSS.
      DISPLAY ANSS.
      STOP RUN.