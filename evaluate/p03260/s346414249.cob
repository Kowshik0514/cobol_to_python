IDENTIFICATION DIVISION.
PROGRAM-ID. 180908A.
 
ENVIRONMENT DIVISION.
 
DATA DIVISION.
WORKING-STORAGE SECTION.
01 S.
  02 S-O        OCCURS 3.
    03 SA       PIC X(1) VALUE " ".
01 IDX          PIC 9(6) VALUE ZERO.
01 W_VAL        PIC 9(2).
01 W_SHOW       PIC 9(2).
01 REM          PIC 9(2).
01 ANS          PIC X(3) VALUE "No".
01 W_A			PIC 9.
01 W_B			PIC 9.
PROCEDURE DIVISION.
    ACCEPT S
    PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 3
        MOVE S-O(1) TO W_A
        MOVE S-O(3) TO W_B
        COMPUTE W_VAL = W_A * W_B * IDX
        DIVIDE W_VAL BY 2 GIVING W_SHOW REMAINDER REM
        IF REM = 1 THEN
            MOVE "Yes" TO ANS
        END-IF
    END-PERFORM
    DISPLAY ANS
    STOP RUN.
    