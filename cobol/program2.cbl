       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM2.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  INPUTGRADE       PIC X(6).
       01  NUMGRADE         PIC 999V99.
       01  LETTERGRADE      PIC X(2).
       01  CONTINUE-ANSWER  PIC X(1).
       PROCEDURE DIVISION.
           MOVE "Y" TO CONTINUE-ANSWER
           PERFORM UNTIL CONTINUE-ANSWER = "N"
               DISPLAY "Enter numeric grade (0-100): " WITH NO ADVANCING
               ACCEPT INPUTGRADE
               MOVE INPUTGRADE TO NUMGRADE

               EVALUATE NUMGRADE
                   WHEN 90 THRU 100
                       MOVE "A" TO LETTERGRADE
                   WHEN 80 THRU 89
                       MOVE "B" TO LETTERGRADE
                   WHEN 70 THRU 79
                       MOVE "C" TO LETTERGRADE
                   WHEN 60 THRU 69
                       MOVE "D" TO LETTERGRADE
                   WHEN OTHER
                       MOVE "F" TO LETTERGRADE
               END-EVALUATE

               DISPLAY "Letter grade: " LETTERGRADE
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
          END PROGRAM PROGRAM2.
