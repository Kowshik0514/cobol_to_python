IDENTIFICATION DIVISION.
PROGRAM-ID. MoveExample.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NUM1     PIC 9(5).
01 A PIC 9(4) VALUE 1000.
01 WS-STRING1  PIC X(10).
01 WS-STRING2  PIC X(10).

PROCEDURE DIVISION.
    MOVE A TO WS-NUM1.
    MOVE 'HELLO' TO WS-STRING1, WS-STRING2.
    
    DISPLAY 'WS-NUM1: ' WS-NUM1.
    DISPLAY 'WS-STRING1: ' WS-STRING1.
    DISPLAY 'WS-STRING2: ' WS-STRING2.
    
    STOP RUN.