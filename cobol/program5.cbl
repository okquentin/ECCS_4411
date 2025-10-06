       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM5.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUT-NUMS          PIC X(50).
       01  NUM-LIST.
           05  NUM-ITEM        PIC 9(5)V9(5) OCCURS 100 TIMES.
       01  WS-INDEX            PIC 9(4) VALUE 0.
       01  WS-PARSE-INDEX      PIC 9(4) VALUE 1.
       01  WS-NUM-START        PIC 9(4) VALUE 1.
       01  WS-NUM-END          PIC 9(4) VALUE 1.
       01  WS-NUM-TEXT         PIC X(10).
       01  WS-NUM-FLOAT        PIC 9(5)V9(5).
       01  WS-MAX              PIC S9(5)V9(5) VALUE -99999.99999.
       01  WS-MIN              PIC S9(5)V9(5) VALUE 99999.99999.
       01  CONTINUE-ANSWER     PIC X(1).
       PROCEDURE DIVISION.
           MOVE "Y" TO CONTINUE-ANSWER
           PERFORM UNTIL CONTINUE-ANSWER = "N"
               DISPLAY "Enter comma separated list of numbers: " 
               WITH NO ADVANCING
               ACCEPT INPUT-NUMS

               MOVE 1 TO WS-PARSE-INDEX
               MOVE 1 TO WS-INDEX
               PERFORM VARYING WS-NUM-START FROM 1 BY 1 UNTIL 
               WS-NUM-START > LENGTH OF INPUT-NUMS
                   IF INPUT-NUMS(WS-NUM-START:1) = "," OR WS-NUM-START = 
                   LENGTH OF INPUT-NUMS
                       COMPUTE WS-NUM-END = WS-NUM-START - 
                       WS-PARSE-INDEX
                       MOVE INPUT-NUMS(WS-PARSE-INDEX:WS-NUM-END) TO 
                       WS-NUM-TEXT
                       MOVE FUNCTION NUMVAL(WS-NUM-TEXT) TO WS-NUM-FLOAT
                       MOVE WS-NUM-FLOAT TO NUM-ITEM(WS-INDEX)
                       IF WS-NUM-FLOAT > WS-MAX
                           MOVE WS-NUM-FLOAT TO WS-MAX
                       END-IF
                       IF WS-NUM-FLOAT < WS-MIN
                           MOVE WS-NUM-FLOAT TO WS-MIN
                       END-IF
                       ADD 1 TO WS-INDEX
                       ADD 1 TO WS-NUM-START
                       MOVE WS-NUM-START TO WS-PARSE-INDEX
                   END-IF
               END-PERFORM

               DISPLAY "Minimum: " WS-MIN
               DISPLAY "Maximum: " WS-MAX

               MOVE 99999.99999 TO WS-MIN
               MOVE -99999.99999 TO WS-MAX

               DISPLAY "Continue? (y/n): " WITH NO ADVANCING
               ACCEPT CONTINUE-ANSWER
      
               IF CONTINUE-ANSWER = "y"
                   MOVE "Y" TO CONTINUE-ANSWER
               ELSE
                   IF CONTINUE-ANSWER = "n"
                       MOVE "N" TO CONTINUE-ANSWER
                   ELSE
                       DISPLAY "Invalid input. Please enter 'y' or 'n'."
                       MOVE "Y" TO CONTINUE-ANSWER
                   END-IF
               END-IF 
           END-PERFORM 
           STOP RUN.
       END PROGRAM PROGRAM5.