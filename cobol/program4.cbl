       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM4.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUT-STRING       PIC X(20).
       01  PALINDROME-STRING  PIC X(20).
       01  NONSPACE-COUNT     PIC 9(2) VALUE 0.
       01  CHAR-POS           PIC 9(2) VALUE 1.
       01  CONTINUE-ANSWER    PIC X(1).
       01  WS-INDEX           PIC 9(2) VALUE 1.
       PROCEDURE DIVISION.
           MOVE "Y" TO CONTINUE-ANSWER
           PERFORM UNTIL CONTINUE-ANSWER = "N"
               DISPLAY "Enter a string: " WITH NO ADVANCING
               ACCEPT INPUT-STRING
               
               PERFORM VARYING CHAR-POS FROM 1 BY 1 UNTIL CHAR-POS > 20
               IF INPUT-STRING (CHAR-POS:1) NOT = SPACE
                   ADD 1 TO NONSPACE-COUNT
               END-IF
               END-PERFORM

               PERFORM UNTIL NONSPACE-COUNT = 0
                   MOVE INPUT-STRING (NONSPACE-COUNT:1) TO 
                   PALINDROME-STRING (WS-INDEX:1)

                   ADD 1 TO WS-INDEX
                   COMPUTE NONSPACE-COUNT = NONSPACE-COUNT - 1
               END-PERFORM

               DISPLAY "PALINDROME STRING: " PALINDROME-STRING

               IF INPUT-STRING = PALINDROME-STRING
                   DISPLAY "String is a palindrome"
               ELSE 
                   DISPLAY "String is not a palindrome"
               END-IF

               MOVE SPACES TO INPUT-STRING
               MOVE 1 TO WS-INDEX 
               MOVE 1 TO CHAR-POS
               MOVE 0 TO NONSPACE-COUNT


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
       END PROGRAM PROGRAM4.