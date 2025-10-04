       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM1.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-CONSTANTS.
           05  WS-MAX-LEN-20         PIC 9(02) VALUE 20.
           05  WS-ONE                PIC 9(01) VALUE 1.

       01  WS-INPUT-FIELDS.
           05  STORE-NAME          PIC X(100).
           05  ITEM                PIC X(30).
           05  PRICE               PIC 999V99.
           05  CONTINUE-ANSWER     PIC X(1).

       01  WS-PROCESSING-FIELDS.
           05  ITEMS               PIC 9(4) VALUE 0.
           05  SUBTOTAL            PIC 999V99 VALUE ZERO.
           05  SALES-TAX           PIC 9V999 VALUE 0.0575.
           05  TAX                 PIC 999V99 VALUE ZERO.
           05  TOTAL               PIC 999V99 VALUE ZERO.
           05  PRINTINDEX          PIC 9(4) VALUE 1.
           05  WS-TRUE-LENGTH      PIC 9(02).  
           05  WS-INDEX            PIC 9(02).  
           05  WS-TRIMMED-NAME     PIC X(20).
           05  WS-LINE-NUM         PIC 9(4) VALUE 0.  
           05  WS-SPACE-NUM        PIC 9(4) VALUE 0.
           05  SPACEINDEX          PIC 9(4) VALUE 1.

       01  WS-ITEMLIST.
           05  ITEMLIST            PIC X(30) OCCURS 1 TO 100 TIMES
                                   DEPENDING ON ITEMS.
                                   
       01  WS-PRICES.
           05  PRICES              PIC 999V99 OCCURS 1 TO 100 TIMES
                                   DEPENDING ON ITEMS.
       PROCEDURE DIVISION.
           DISPLAY "[RECEIPT FORMATTER]" 

           DISPLAY "Enter Store Name: " WITH NO ADVANCING
           ACCEPT STORE-NAME

           MOVE "Y" TO CONTINUE-ANSWER
           PERFORM UNTIL CONTINUE-ANSWER = "N"
               DISPLAY "Enter Item: " WITH NO ADVANCING
               ACCEPT ITEM
               COMPUTE ITEMS = ITEMS + 1
               MOVE ITEM TO ITEMLIST(ITEMS)

               DISPLAY "Enter Price: " WITH NO ADVANCING
               ACCEPT PRICE
               MOVE PRICE TO PRICES(ITEMS)
               COMPUTE SUBTOTAL = SUBTOTAL + PRICE

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
           END-PERFORM. 

           MOVE WS-MAX-LEN-20 TO WS-TRUE-LENGTH
           PERFORM VARYING WS-INDEX FROM WS-MAX-LEN-20 BY -1
               UNTIL WS-INDEX IS LESS THAN WS-ONE
               IF STORE-NAME (WS-INDEX : 1) NOT EQUAL TO SPACE
                   MOVE WS-INDEX TO WS-TRUE-LENGTH
                   EXIT PERFORM
               END-IF
               MOVE WS-INDEX TO WS-TRUE-LENGTH 
           END-PERFORM.

           PERFORM UNTIL PRINTINDEX = 10
               DISPLAY " "
               COMPUTE PRINTINDEX = PRINTINDEX + 1
           END-PERFORM

           DISPLAY "Thank you for shopping at " *> 26 chars (inc spaces)
                   STORE-NAME (1:WS-TRUE-LENGTH) "!" *> 1 char
           MOVE 0 TO PRINTINDEX
           PERFORM UNTIL PRINTINDEX = 27
               DISPLAY "-" WITH NO ADVANCING
               COMPUTE PRINTINDEX = PRINTINDEX + 1
               COMPUTE WS-LINE-NUM = WS-LINE-NUM + 1
           END-PERFORM
           MOVE 0 TO PRINTINDEX
           PERFORM UNTIL PRINTINDEX = WS-TRUE-LENGTH
               DISPLAY "-" WITH NO ADVANCING
               COMPUTE PRINTINDEX = PRINTINDEX + 1
               COMPUTE WS-LINE-NUM = WS-LINE-NUM + 1
           END-PERFORM
           DISPLAY " "

           MOVE 1 TO PRINTINDEX
           PERFORM UNTIL PRINTINDEX = ITEMS + 1

               MOVE WS-MAX-LEN-20 TO WS-TRUE-LENGTH
               PERFORM VARYING WS-INDEX FROM WS-MAX-LEN-20 BY -1
                   UNTIL WS-INDEX IS LESS THAN 1
                   IF ITEMLIST(PRINTINDEX) (WS-INDEX : 1) NOT EQUAL TO 
                   SPACE
                       MOVE WS-INDEX TO WS-TRUE-LENGTH
                       EXIT PERFORM
                   END-IF
                   MOVE 0 TO WS-TRUE-LENGTH
               END-PERFORM

               DISPLAY ITEMLIST(PRINTINDEX) (1:WS-TRUE-LENGTH)
                       ":" WITH NO ADVANCING *> adds 1 char to spaces

               COMPUTE WS-SPACE-NUM = WS-LINE-NUM - WS-TRUE-LENGTH - 6
               PERFORM UNTIL SPACEINDEX = WS-SPACE-NUM - 1
                   DISPLAY "" WITH NO ADVANCING
                   COMPUTE SPACEINDEX = SPACEINDEX + 1
               END-PERFORM
               MOVE 1 TO SPACEINDEX
               DISPLAY "$" PRICES(PRINTINDEX)
               COMPUTE PRINTINDEX = PRINTINDEX + 1
           END-PERFORM
           MOVE 1 TO PRINTINDEX
           PERFORM UNTIL PRINTINDEX = 4
               DISPLAY " "
               COMPUTE PRINTINDEX = PRINTINDEX + 1
           END-PERFORM
           
           

           DISPLAY "            Subtotal: " WITH NO ADVANCING *> 22 char
           MOVE 1 TO SPACEINDEX
           PERFORM UNTIL SPACEINDEX = WS-LINE-NUM - 22 - 6
               DISPLAY "" WITH NO ADVANCING
               COMPUTE SPACEINDEX = SPACEINDEX + 1
           END-PERFORM
           DISPLAY "$" SUBTOTAL

           DISPLAY "            Tax: "  WITH NO ADVANCING *> 17 chars
           MOVE 1 TO SPACEINDEX
           PERFORM UNTIL SPACEINDEX = WS-LINE-NUM - 17 - 6
               DISPLAY "" WITH NO ADVANCING
               COMPUTE SPACEINDEX = SPACEINDEX + 1
           END-PERFORM
           COMPUTE TAX = SUBTOTAL * SALES-TAX
           DISPLAY "$" TAX

           DISPLAY "            TOTAL: " WITH NO ADVANCING *> 19 chars
           MOVE 1 TO SPACEINDEX
           PERFORM UNTIL SPACEINDEX = WS-LINE-NUM - 19 - 6
               DISPLAY "" WITH NO ADVANCING
               COMPUTE SPACEINDEX = SPACEINDEX + 1
           END-PERFORM
           COMPUTE TOTAL = SUBTOTAL + TAX
           DISPLAY "$" TOTAL


           STOP RUN.
       END PROGRAM PROGRAM1.