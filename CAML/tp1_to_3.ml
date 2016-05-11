(*
###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################

This is NOT in the COURSES of supinfo. OCAML is a child of lisp develop by INRA (french ;))
Consult documentation for more information :) http://caml.inria.fr/
CAML is a HARD TYPED LANGAGE, type constructor help to create type so you can match more things ;)
   CAML will always take the SMALLEST RESTRICTION type when prototyping the function
ALl the function are tested with SUBLIME REPL on linux (ocaml package install)
*)
(* TP 1 - La Programmation Fonctionnelle (done with a langage :O) *)
(* TP 1 - 1 - APPARTENANCE *)
(* Let rec name p1 p2 etc define a RECURSIVE function of name "name"
  using p1 p2 etc as parameters
*)
let rec find_red l_color =
  (* match X with tell to match X with values (if X == Values then do ->
    match case are introduce with |
    _ is the undefined case
  *)
  match l_color with
  (*
    l color is a string list ('a list is a basic type of OCAML)
    [] is the empty list
    t::q represent a list who have at least one element
    t is the head of the list
    q the queue :p
    you can't acces other elements than head of list (you don't have
    direct to nth elements of list in CAML)
  *)
  | [] -> false
  | t::q -> t = "red" || find_red q;;
let rec find_color l_color c =
  match l_color with
  | [] -> false
  | t::q -> t = c || find_color q c;;
(* Test the function *)
#trace find_red;;
let rest_red_1 = ["green";"green";"red"; "red"];;
let rest_red_2 = ["green";"green";"green";"blue"];;
find_red rest_red_1;;
find_red rest_red_2;;
find_color rest_red_1;;
find_color rest_red_1;;
(* TP 1 - 2 - AUTANT DE 1 QUE DE 0 *)
(* (X,Y,Z,...) is a tuple of X, Y, Z, etc ...
   access can be done with tuple.p_element
*)
let rec asmuch_naive_rec list n1 n0 =
  match list with
  | [] -> (n1,n0)
  | t::q -> if (t = 1)
              then asmuch_naive_rec q (n1+1) n0
              else asmuch_naive_rec q n1 (n0+1);;
let asmuch_naive list =
  let (a,b) = asmuch_naive_rec list 0 0 in a = b;;

let rec asmuch_naive_less_variable_rec list n =
  match list with
  | [] -> n = 0
  | t::q -> if (t = 1)
              then asmuch_naive_less_variable_rec q (n+1)
              else asmuch_naive_less_variable_rec q (n-1)
;;
let asmuch_naive_less_variable list =
  asmuch_naive_less_variable_rec list 0;;
(* Those 2 are the easiest && fastet way to solve the pb in caml
   As we can't have a quick access to the end of the list ;)
   if we want to adapt the subject to CAML :
   we have say that bits are done by having as much as possible
   1 between 0 && 0 between 1 if format like this
*)
let rec asmuch_camlformat list =
  match list with
  | [] -> true
  | t::[] -> false
  | a::b::q -> a != b && asmuch_camlformat q;;

(* TP 1 - 3 - AUTANT DE 1 QUE DE 0 *)
let rec more_naive_rec list n1 n0 =
  match list with
  | [] -> (n1,n0)
  | t::q -> if (t = 1)
              then more_naive_rec q (n1+1) n0
              else more_naive_rec q n1 (n0+1);;
let more_naive list =
  let (a,b) = more_naive_rec list 0 0 in a != b;;

let rec more_naive_less_variable_rec list n =
  match list with
  | [] -> n != 0
  | t::q -> if (t = 1)
              then more_naive_less_variable_rec q (n+1)
              else more_naive_less_variable_rec q (n-1)
;;
let more_naive_less_variable list =
  more_naive_less_variable_rec list 0;;
(* Those 2 are the easiest && fastet way to solve the pb in caml
   As we can't have a quick access to the end of the list ;)
   if we want to adapt the subject to CAML :
   we have say that bits are done by having as much as possible
   1 between 0 && 0 between 1 if format like this
*)
let rec more_camlformat list =
  match list with
  | [] -> false
  | t::[] -> true
  | a::b::q -> a = b || more_camlformat q;;

(* all the function can work with the format we described for caml
so the test case wil be like this :) *)
let test_bits_eq = [1;0;1;0;1;0];;
let test_bits_1 = [1;0;1;0;1;0;1;1;1;1];;
let test_bits_0 = [0;1;0;1;0;1;0;0];;
(* #trace more_naive;;
#trace more_naive_less_variable;;
#trace more_camlformat;; *)
asmuch_naive test_bits_eq;;
asmuch_naive test_bits_1;;
asmuch_naive test_bits_0;;
asmuch_naive_less_variable test_bits_eq;;
asmuch_naive_less_variable test_bits_1;;
asmuch_naive_less_variable test_bits_0;;
asmuch_camlformat test_bits_eq;;
asmuch_camlformat test_bits_1;;
asmuch_camlformat test_bits_0;;
(**)
more_naive test_bits_eq;;
more_naive test_bits_1;;
more_naive test_bits_0;;
more_naive_less_variable test_bits_eq;;
more_naive_less_variable test_bits_1;;
more_naive_less_variable test_bits_0;;
more_camlformat test_bits_eq;;
more_camlformat test_bits_1;;
more_camlformat test_bits_0;;