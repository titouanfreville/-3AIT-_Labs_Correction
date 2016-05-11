; ###############################################################
; ############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
; #### Feel free to use this to improve, but don't copy them ####
; ###############################################################


; || -> ou alors (ou paresseux)
; :: -> concaténation sur les listes :)
; Set labyrinthe
(setq lab '(
    ($ $ $ $ $ $ $ $ $ $ $ $)
    (- - - - $ $ - - - - - $)
    ($ $ $ - - - - $ - $ - $)
    ($ - - - - $ $ - - $ - $)
    ($ - $ $ - $ $ $ $ $ $ $)
    ($ - - - $ $ $ - - - $ $)
    ($ - $ - - - - - $ - - fin)
    ($ $ $ $ $ $ $ $ $ $ $ $)
  )
)
;
;@in
;@PARAMETERS element, list
;@RETURN true si element in list, false sinon
(defun in (a l)
  (cond
    ((null l) nil)
    ((eq a 0) (cond 
                ((eq (first l) '-))
                ((eq (first l) 'fin))
              ))
    (t (in (- a 1) (cdr l)))
  )
)
;test
(setq tl '($ - fin))
(in 0 tl)
(in 1 tl)
(in 2 tl)
;@check
;@param labyrinthe, POINT (x,y)
;@RETURN true if POINT is a path (-), false else ($).
(defun check (labyrinthe point)
  (setq x (first point) y (second point))
  (cond
    ((< x 0) nil)
    ((null labyrinthe) nil)
    ((= x 0) (in y (first labyrinthe)))
    (t (check (cdr labyrinthe) (list (- x 1) y)))
  )
)
;@replace
;@param labyrinthe, POINT (x,y), char
;@RETURN labyrinthe with POINT (x,y) = char.
(defun replace (labyrinthe point c)
  (setq x (first point) y (second point c))
  (cond
    ((< x 0) nil)
    ((null labyrinthe) nil)
    ((= x 0) (replace_list (first labyrinthe) y )
    (t (check (cdr labyrinthe) (list (- x 1) y)))
  )
)
;test
(check lab '(0 1))
(check lab '(1 1))
(check lab '(3 1))
(check lab '(6 11))
;@read_lab
;@PARAM labyrinthe comming with FIN, DEBUT(x,y) point to start on
;@RETRUN all trees able to go from start to end
(defun read_lab (labyrinthe, start)
  (
    (setq (h '((+ (first start) 1) (second start))
           b '((- (first start) 1) (second start))
           g '((first start) (- (second start) 1))
           g '((first start) (+ (second start) 1))
          ))
    ()
    (cond
      ((check h))
    )
  )
)