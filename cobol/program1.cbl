       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  N              PIC 9(30).
       01  WS-AGE         PIC 99.
       01  INDEXNUM       PIC 9(2) VALUE 0.
       01  COLUMNNUM      PIC 9(2) VALUE 0.
       01  MULT           PIC 9(2).
       PROCEDURE DIVISION.
           DISPLAY "[MULTIPLICATION TABLE PRINTER]" 
           DISPLAY "Enter a table size (<99): " WITH NO ADVANCING
           ACCEPT N.

           IF N >= 99 
            DISPLAY "Table size must be less than 99"
            STOP RUN
           END-IF

           PERFORM VARYING indexnum FROM 1 BY 1 UNTIL indexnum > N
               DISPLAY INDEXNUM WITH NO ADVANCING
               DISPLAY "    " WITH NO ADVANCING
           END-PERFORM

           DISPLAY " "
           DISPLAY " "
           MOVE 0 TO indexnum

           PERFORM VARYING INDEXNUM FROM 2 BY 1 UNTIL INDEXNUM > N
               DISPLAY INDEXNUM WITH NO ADVANCING
               DISPLAY "    " WITH NO ADVANCING
               PERFORM VARYING COLUMNNUM FROM 2 BY 1 UNTIL COLUMNNUM > N
                   COMPUTE MULT = INDEXNUM * COLUMNNUM
                   DISPLAY MULT WITH NO ADVANCING
                   DISPLAY "    " WITH NO ADVANCING
               END-PERFORM
               DISPLAY " "
           END-PERFORM

           STOP RUN.
       END PROGRAM PROGRAM1.