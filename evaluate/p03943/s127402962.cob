IDENTIFICATION                   DIVISION.
PROGRAM-ID.                      ABC_047_A.
DATA                             DIVISION.
WORKING-STORAGE                  SECTION.
    01 INP     PIC X(11).
    01 a       PIC 9(3).
    01 b       PIC 9(3).
    01 c       PIC 9(3).
    01 x       PIC 9(3).
    01 q       PIC 9(3).
    01 r       PIC 9(1).

PROCEDURE                        DIVISION.
    ACCEPT INP.

    UNSTRING INP
    DELIMITED BY SPACE
    INTO a b c.

    COMPUTE x = a + b + c.
    DIVIDE 2 INTO x GIVING q REMAINDER r.

    IF r = 1 THEN
        DISPLAY "No"
    ELSE
        IF a = q OR b = q OR c = q THEN
            DISPLAY "Yes"
        ELSE
            DISPLAY "No"
        END-IF
    END-IF.

    STOP RUN.
