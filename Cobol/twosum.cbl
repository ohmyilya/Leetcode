IDENTIFICATION DIVISION.
PROGRAM-ID. TwoSum.
DATA DIVISION.
WORKING-STORAGE SECTION.
01 NumToIndex OCCURS 100000 TIMES PIC 9(5).
01 Result OCCURS 2 TIMES PIC 9(5).
01 Target PIC 9(5).
01 Num PIC 9(5).
01 Index PIC 9(5).
01 Complement PIC 9(5).
01 Found FLAG VALUE 'N'.

PROCEDURE DIVISION.
    MOVE 0 TO Index
    PERFORM VARYING Index FROM 1 BY 1 UNTIL Index > 100000
        MOVE -1 TO NumToIndex(Index)
    END-PERFORM

    MOVE 0 TO Index
    PERFORM VARYING Index FROM 1 BY 1 UNTIL Index > LENGTH OF Nums
        COMPUTE Complement = Target - Nums(Index)
        IF NumToIndex(Complement) NOT EQUAL TO -1
            MOVE NumToIndex(Complement) TO Result(1)
            MOVE Index TO Result(2)
            MOVE 'Y' TO Found
            EXIT PERFORM
        END-IF
        MOVE Index TO NumToIndex(Nums(Index))
    END-PERFORM

    IF Found EQUAL TO 'N'
        DISPLAY "No solution found."
    ELSE
        DISPLAY "Indices: " Result(1) " " Result(2)
    END-IF

    STOP RUN.

DATA DIVISION.
01 Nums OCCURS 4 TIMES PIC 9(5).
