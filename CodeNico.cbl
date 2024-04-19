      ****************************************************************
      * REALISATION D UNE CALCULATRICE
      ******************************************************************       
       
       
      ****************************************************************** 
       IDENTIFICATION DIVISION.
      * nom du programme
           PROGRAM-ID. Calculatrice.
      * nom de l'auteur
           AUTHOR. Nicolas_SCHNEIDER.
      * date d'écriture     
           DATE-WRITTEN. 2024-04-09.
      
      ****************************************************************** 
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      * declaration des variables 
           01 NUM         PIC 9(3).
           01 TOTAL       PIC 9(10).
           01 OPERATEUR   PIC X.
           01 CONTINUER   PIC X.
           01 CALCUL-ENTIER PIC X(50).


      ****************************************************************** 
       PROCEDURE DIVISION.

           DISPLAY "********************".
           DISPLAY "*   CALCULATRICE   *".
           DISPLAY "********************".
      * Saisie des données
           DISPLAY "Entrez le premier nombre : "
           ACCEPT NUM
      * on stocke dans total pour la suite du ou des calculs
           MOVE NUM TO TOTAL.
      * on demande si on veut continuer le calcul
       CONTINUER-CALCUL.
           DISPLAY "Voulez-vous continuer le calcul (O/N) ?"
           ACCEPT CONTINUER
           IF CONTINUER = "N" OR CONTINUER = "n" THEN
               DISPLAY "Le calcul complet est : " CALCUL-ENTIER
               DISPLAY "Le résultat final est : " TOTAL
           STOP RUN
           END-IF
      * on selectionne l'operateur
           DISPLAY "Entrez l'opérateur (+, -, *, /) : "
           ACCEPT OPERATEUR.

           DISPLAY "Entrez le nombre suivant : " WITH NO ADVANCING.
           ACCEPT NUM.
           DISPLAY TOTAL OPERATEUR NUM
      * on evalue l'operateur pour faire l'operation souhaitée
           EVALUATE OPERATEUR
               WHEN "+" PERFORM ADDITION
               WHEN "-" PERFORM SOUSTRACTION
               WHEN "*" PERFORM MULTIPLICATION
               WHEN "/" PERFORM DIVISER
               WHEN OTHER PERFORM UNKNOWN-OPERATOR
           END-EVALUATE.

           GO TO CONTINUER-CALCUL.

      ******************************************************************
      * FONCTIONS
      ******************************************************************
       ADDITION.
           COMPUTE TOTAL = TOTAL + NUM.
           EXIT.

       SOUSTRACTION.
           COMPUTE TOTAL = TOTAL - NUM.
           EXIT.

       MULTIPLICATION.
           COMPUTE TOTAL = TOTAL * NUM.
           EXIT.

       DIVISER.
           IF NUM = 0 THEN
               DISPLAY "Erreur : Division par zéro."
           ELSE
               COMPUTE TOTAL = TOTAL / NUM
           END-IF.
           EXIT.

       UNKNOWN-OPERATOR.
           DISPLAY "Erreur : Opérateur inconnu.".
           EXIT.
