IDENTIFICATION DIVISION.
PROGRAM-ID. AcceptFromKeyboard.

ENVIRONMENT DIVISION.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS_NAME PIC X(30).

PROCEDURE DIVISION.
    DISPLAY "Please enter your name: ".
    ACCEPT WS_NAME.
    DISPLAY "You entered: " WS_NAME.
    STOP RUN.