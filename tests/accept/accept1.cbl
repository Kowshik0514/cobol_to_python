IDENTIFICATION DIVISION. 
PROGRAM-ID. AcceptDateExample. 
DATA DIVISION. 
WORKING-STORAGE SECTION. 
01  WS-Date    PIC 9(8). 
PROCEDURE DIVISION. 
ACCEPT WS-Date FROM DATE. 
DISPLAY "Accepted Date: " WS-Date. 
STOP RUN. 
