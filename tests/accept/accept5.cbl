IDENTIFICATION DIVISION. 
PROGRAM-ID. AcceptDayOfWeekExample. 
DATA DIVISION. 
WORKING-STORAGE SECTION. 
01  WS-DayOfWeek    PIC 9(1). 
PROCEDURE DIVISION. 
ACCEPT WS-DayOfWeek FROM DAY_OF_WEEK. 
DISPLAY "Accepted Day of Week: " WS-DayOfWeek. 
STOP RUN. 
