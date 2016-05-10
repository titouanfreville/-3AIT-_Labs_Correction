; ; ###############################################################
; ; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; ; #### Feel free to use this to improve, but don't copy them ####
; ; ###############################################################


; ; || -> ou alors (ou paresseux)
; ; :: -> concaténation sur les listes :)

; ; Les syntaxes ne sont plus que pb pas correct.
; ;En commentaire : une description écrite du fonctionnement (non correspondant àla façon définie dans le cours ~~)
; ; Ceci est du LISP ;)
; ; Il doit être exécutable ~~ 
; ; coder sous linux via SUBLIME TEXT 3 + Sublime REPL + CLISP


; ; ---- TP 1 --------------------------------------------------------------------
; ; --------- 1 ------------------------------------------------------------------
; ; Au Sens des Constructeurs :
; ; Soit red_in la fonction -> Boolean
; ;  F([]) = false
; ;  F(e°F) = e == "red" || red_in (F)
; ;
; ; Au sens des sélecteurs
; ; Soit red_in la fonction -> Boolean
; ; F(E): selon E
; ;    Vide (E) : false
; ;    non Vide(E): Premier(E) == "red" || red_in (Fin(E))
; (defun red_in (L)
;   (cond
;     ((null L) nil))
;     ((eq (car L) "red"))
;     ((red_in (cdr L)))
;   )
; )

; ; Au Sens des Constructeurs :
; ; Soit color_in la fonction -> Boolean
; ;  F([],color) = false
; ;  F(e°E,color) = e == color || red_in (E)
; ;
; ; Au sens des sélecteurs
; ; Soit red_in la fonction -> Boolean
; ; F(E,color): selon E
; ;    Vide (E) : false
; ;    non Vide(E): Premier(E) == color || red_in (Fin(E,color))
; (defun color_in (color L)
;   (cond
;     ((null L) nil)
;     ((eq (car L) color))
;     ((red_in (cdr L)))
;   )
; )
; ; ------------------------------------------------------------------------------
; ; --------- 2 ------------------------------------------------------------------
; ; Naïve
; ;
; ; Au Sens des Constructeurs :
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ;  F([],n1,n0) = n1==n0
; ;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
; ;                           sinon O_1_eq_imp1 E n1 n0+1
; ;
; ; Au sens des sélecteurs
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ; F(E,n1,n0): selon E
; ;  Vide (E) : n1==n0
; ;  non Vide(E): Premier(E) == 1 && O_1_eq_imp1 (Fin E) n1+1 n0 || O_1_eq_imp1 (Fin E) n1 n0+1
; (defun O_1_eq_imp1 (L acc1 acc2)
;   (cond
;     ((null L) (eq acc1 acc2))
;     ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
;     (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
;   )
; )

; ;Funny
; ; Au Sens des Constructeurs :
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ;  F([]) = true
; ;  F(e°[]) = false
; ;  F(p°L°d) = Si p == d alors false,
; ;                       sinon 0_1_eq_imp2 L
; ;
; ; Au sens des sélecteurs
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ; F(E): selon E
; ;  Vide (E) : true
; ;  Singleton (E) : false
; ;  non Vide(E): Premier(E) == Dernier(E) && false || 0_1_eq_imp2 Reste(E)
; (defun 0_1_eq_imp2 (L)
;   (cond
;     ((null L))
;     ((null (cdr L) nil))
;     ((eq (car L) (cdr (last L))) nil)
;     (T 0_1_eq_imp2 (cdr L))
;   )
; )

; ;Two parts :)
; ; 1 - Split the list in 2
; ; 2 - Compare last element of list 1 && first element of list 2
; ; SPLIT :
; ; Au Sens des Constructeurs :
; ; Soit split la fonction -> (l1,l2)
; ;  F([]) = (l1,l2)
; ;  F(p°[]) = (p::l1,l2)
; ;  F(p°L°d) = split L (p::l1) (d::l2)
; (defun split (L acc1 acc2)
;   (cond
;     ((null L) (cons acc1 acc2))
;     ((null (cdr L)) (cons (first L) acc1,acc2))
;     (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
;   )
; )

; ;test
; ;0_1_eq_imp3 L :
; ;(l1,l2) = split L, last (l1) != first (l2)
; (defun 0_1_eq_imp3 (L)
;   (L1,L2)=split L, last (L1) != first (L2)
; )
; ; ------------------------------------------------------------------------------
; ; --------- 3 ------------------------------------------------------------------
; ; Naïve
; ;
; ; Au Sens des Constructeurs :
; ; Soit O_1_eq_imp1 la fonction -> Boolean
; ;  F([],n1,n0) = if n1>n0 then 1 else if n0>n1 then 0
; ;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
; ;                           sinon O_1_eq_imp1 E n1 n0+1
; (defun O_1_eq_imp1 (L acc1 acc2)
;   (cond
;     ((null L) (cond (acc1>acc2 1) (acc2 > acc1 0))
;     ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
;     (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
;   )
; )

; ;Funny
; ; Au Sens des Constructeurs :
; ; Soit 0_1_eq_imp2 la fonction -> Boolean
; ;  F([]) = true
; ;  F(e°[]) = e
; ;  F(p°L°d) = Si p == d alors e,
; ;                       sinon 0_1_eq_imp2 L
; (defun 0_1_eq_imp2 (L)
;   (cond
;     ((null L) false)
;     ((null (cdr L) car L))
;     ((eq (car L) (cdr (last L))) car L)
;     (T 0_1_eq_imp2 (cdr L))
;   )
; )

; ;Two parts :)
; ; 1 - Split the list in 2
; ; 2 - Compare last element of list 1 && first element of list 2
; ; SPLIT :
; ; Au Sens des Constructeurs :
; ; Soit split la fonction -> (l1,l2)
; ;  F([]) = (l1,l2)
; ;  F(p°[]) = (p::l1,l2)
; ;  F(p°L°d) = split L (p::l1) (d::l2)
; (defun split (L acc1 acc2)
;   (cond
;     ((null L) (cons acc1 acc2))
;     ((null (cdr L)) (cons (first L) acc1,acc2))
;     (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
;   )
; )

; ;test
; ;0_1_eq_imp3 L :
; ;(l1,l2) = split L, last (l1) != first (l2)
; (defun 0_1_eq_imp3 (L)
;   (L1,L2)=split L, last (L1) == first (L2) && first (L1)
; )
; ; ------------------------------------------------------------------------------
; ; ---- TP 2 --------------------------------------------------------------------
; (setq l '(1 2 ((3 (4) 5))))
; ; --------- 1 ------------------------------------------------------------------
; (defun last_of_list (l)
;   (cond
;     ((null l) l)
;     ((null (cdr l)) (first l))
;     (t (last_of_list (cdr l)))
;   )
; )

; (last_of_list l)

; (defun last_elements_first_tree_in_list (l)
;   (cond
;     ((null l) l)
;     ((listp (first l)) (last_elements_first_tree_in_list (first l))) 
;     ((null (cdr l)) (first l))
;     (t (last_elements_first_tree_in_list (cdr l)))
;   )
; )

; (last_elements_first_tree_in_list l)

; (defun last_elements_first_list (l)
;   (cond
;     ((null l) l)
;     ((listp (first l)) (last_of_list (last_of_list (first l)))) 
;     ((null (cdr l)) (first l))
;     (t (last_elements_first_list (cdr l)))
;   )
; )

; (last_elements_first_list l)
; ; ------------------------------------------------------------------------------
; ; --------- 2 ------------------------------------------------------------------
; ;null
; (setq l '(a b 1 2))
; (setq l2 '())
; (null l)
; (null l2)
; ;
; ;eq
; (eq 1 2)
; (eq "a" "b")
; ;list
; (setq l3 '(a b 1 2))
; (setf l4 '(a b (1 2)))
; (setq l5 '((a b) 1 2))
; ; etc ....
; ;
; ; define error list_to_small to use when list is too short for properties ~~
; (define-condition list_to_small (error) nil)
 
; ;check_third_element
; ; @PARAM list 
; ; @RETURN nill 3rd element isn't a list; true else
; ; @THROW list_to_small if list don't have 3 elements
; (defun check_third_element (l)
;   (cond
;     ((null l) (error 'list_to_small))
;     ((atom l) (error 'list_to_small))
;     ((null (cdr (cdr l))) (error 'list_to_small))
;     (T (listp (third l)))
;   )  
; )
; (setq l6 '(a c))

; (check_third_element l)
; (check_third_element l2)
; (check_third_element l4)
; (check_third_element l5)
; (check_third_element l6)
; ; ------------------------------------------------------------------------------
; --------- 3 ------------------------------------------------------------------
(setq l '((a b c) (b (bc)) (12 x) (42 vrai)))
;RetournerValeur
; @PARAM i index, l list
; @RETURN NIL if i don't exist in l; cdr i sinon
(defun RetournerValeur (i l)
  (cond
    ((null l) nil)
    ((eq (first (first l)) i) (cdr (first l)))
    (T (RetournerValeur i (cdr l)))
  )
)
;test
(RetournerValeur 'a l)
(RetournerValeur 'b l)
(RetournerValeur 12 l)
(RetournerValeur 666 l)
;
;
;Carre
; @PARAM i rationnel
; @RETURN i*i
(defun Carre (i)
  (cond
    ((eq i 0) 0)
    (T (* i i))
  )
)
;Cube
; @PARAM i rationnel
; @RETURN i^2*i
(defun Cube (i)
  (cond
    ((eq i 0) 0)
    (T (* i (Carre i)))
  )
)
;Afficher
; This function don't have parameter and don't return anything :p it just 
; ask you to enter an INTEGER and print it's square && cube
(defun Afficher ()
  (terpri)
  (princ "Enter an INTEGER to get Square and Cube of it : ")
  (defparameter i (read))
  (defparameter carre (Carre i))
  (defparameter cube (Cube i))
  (format t "Square: = ~W~% Cube = ~W" carre cube)
)
;test
(Afficher)
;
;
(defun multi(n)
  (lambda(arg) (* arg n))
) 

(defun test (i)
  (* i (funcall multi i))
)
(test 2)
;
;
(defun f (fun)
  funcall fun 1
)

(defun fct (i)
  (+ (* 5 i) 3)
)
;test
(trace fct)
(f fct)
; ------------------------------------------------------------------------------
