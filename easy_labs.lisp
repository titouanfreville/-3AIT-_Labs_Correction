; ###############################################################
; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; #### Feel free to use this to improve, but don't copy them ####
; ###############################################################


; || -> ou alors (ou paresseux)
; :: -> concaténation sur les listes :)

; Les syntaxes ne sont plus que pb pas correct.
;En commentaire : une description écrite du fonctionnement (non correspondant àla façon définie dans le cours ~~)
; Ceci est du LISP ;)
; Il doit être exécutable ~~ 
; coder sous linux via SUBLIME TEXT 3 + Sublime REPL + CLISP


; ---- TP 1 --------------------------------------------------------------------
; --------- 1 ------------------------------------------------------------------
; Au Sens des Constructeurs :
; Soit red_in la fonction -> Boolean
;  F([]) = false
;  F(e°F) = e == "red" || red_in (F)
;
; Au sens des sélecteurs
; Soit red_in la fonction -> Boolean
; F(E): selon E
;    Vide (E) : false
;    non Vide(E): Premier(E) == "red" || red_in (Fin(E))
(defun red_in (L)
  (cond
    ((null L) nil))
    ((eq (car L) ("red")))
    ((red_in (cdr L)))
  )
)

; Au Sens des Constructeurs :
; Soit color_in la fonction -> Boolean
;  F([],color) = false
;  F(e°E,color) = e == color || red_in (E)
;
; Au sens des sélecteurs
; Soit red_in la fonction -> Boolean
; F(E,color): selon E
;    Vide (E) : false
;    non Vide(E): Premier(E) == color || red_in (Fin(E,color))
(defun color_in (color L)
  (cond
    ((null L) nil)
    ((eq (car L) color))
    ((red_in (cdr L)))
  )
)
; ------------------------------------------------------------------------------
; --------- 2 ------------------------------------------------------------------
; Naïve
;
; Au Sens des Constructeurs :
; Soit O_1_eq_imp1 la fonction -> Boolean
;  F([],n1,n0) = n1==n0
;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
;                           sinon O_1_eq_imp1 E n1 n0+1
;
; Au sens des sélecteurs
; Soit O_1_eq_imp1 la fonction -> Boolean
; F(E,n1,n0): selon E
;  Vide (E) : n1==n0
;  non Vide(E): Premier(E) == 1 && O_1_eq_imp1 (Fin E) n1+1 n0 || O_1_eq_imp1 (Fin E) n1 n0+1
(defun O_1_eq_imp1 (L acc1 acc2)
  (cond
    ((null L) (eq acc1 acc2))
    ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
    (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
  )
)

;Funny
; Au Sens des Constructeurs :
; Soit 0_1_eq_imp2 la fonction -> Boolean
;  F([]) = true
;  F(e°[]) = false
;  F(p°L°d) = Si p == d alors false,
;                       sinon 0_1_eq_imp2 L
;
; Au sens des sélecteurs
; Soit 0_1_eq_imp2 la fonction -> Boolean
; F(E): selon E
;  Vide (E) : true
;  Singleton (E) : false
;  non Vide(E): Premier(E) == Dernier(E) && false || 0_1_eq_imp2 Reste(E)
(defun 0_1_eq_imp2 (L)
  (cond
    ((null L))
    ((null (cdr L) nil))
    ((eq (car L) (cdr (last L))) nil)
    (T 0_1_eq_imp2 (cdr L))
  )
)

;Two parts :)
; 1 - Split the list in 2
; 2 - Compare last element of list 1 && first element of list 2
; SPLIT :
; Au Sens des Constructeurs :
; Soit split la fonction -> (l1,l2)
;  F([]) = (l1,l2)
;  F(p°[]) = (p::l1,l2)
;  F(p°L°d) = split L (p::l1) (d::l2)
(defun split (L acc1 acc2)
  (cond
    ((null L) (cons acc1 acc2))
    ((null (cdr L)) (cons (first L) acc1,acc2))
    (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
  )
)

;test
;0_1_eq_imp3 L :
;(l1,l2) = split L, last (l1) != first (l2)
(defun 0_1_eq_imp3 (L)
  (L1,L2)=split L, last (L1) != first (L2)
)
; ------------------------------------------------------------------------------
; --------- 3 ------------------------------------------------------------------
; Naïve
;
; Au Sens des Constructeurs :
; Soit O_1_eq_imp1 la fonction -> Boolean
;  F([],n1,n0) = if n1>n0 then 1 else if n0>n1 then 0
;  F(e°E,n1,n0) = Si e == 1 alors O_1_eq_imp1 E n1+1 n0,
;                           sinon O_1_eq_imp1 E n1 n0+1
(defun O_1_eq_imp1 (L acc1 acc2)
  (cond
    ((null L) (cond (acc1>acc2 1) (acc2 > acc1 0))
    ((eq (car L) 1) O_1_eq_imp1 (cdr L) (acc1+1) acc2)
    (T (car L) 1) O_1_eq_imp1 (cdr L) acc1 (acc2+1))
  )
)

;Funny
; Au Sens des Constructeurs :
; Soit 0_1_eq_imp2 la fonction -> Boolean
;  F([]) = true
;  F(e°[]) = e
;  F(p°L°d) = Si p == d alors e,
;                       sinon 0_1_eq_imp2 L
(defun 0_1_eq_imp2 (L)
  (cond
    ((null L) false)
    ((null (cdr L) car L))
    ((eq (car L) (cdr (last L))) car L)
    (T 0_1_eq_imp2 (cdr L))
  )
)

;Two parts :)
; 1 - Split the list in 2
; 2 - Compare last element of list 1 && first element of list 2
; SPLIT :
; Au Sens des Constructeurs :
; Soit split la fonction -> (l1,l2)
;  F([]) = (l1,l2)
;  F(p°[]) = (p::l1,l2)
;  F(p°L°d) = split L (p::l1) (d::l2)
(defun split (L acc1 acc2)
  (cond
    ((null L) (cons acc1 acc2))
    ((null (cdr L)) (cons (first L) acc1,acc2))
    (T split (rest L) (cons (first L) acc1) (cons (last L) acc2))
  )
)

;test
;0_1_eq_imp3 L :
;(l1,l2) = split L, last (l1) != first (l2)
(defun 0_1_eq_imp3 (L)
  (L1,L2)=split L, last (L1) == first (L2) && first (L1)
)
; ------------------------------------------------------------------------------