###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################
# Python tested using python 2 on Ubuntu ;)
# LIST FUNCTIONS ----------------------------------------------------------------------
# FUNCTION ON LISTS WITHOUT DELETE
# @car
# @PARAM list
# @RETURN first element
def car (l):
  return l[0]
# @cdr
# @PARAM list
# @RETURN list without head
def cdr (le):
  le=list(le)
  e = car (le)
  le.remove (e)
  return le
# @last
# @PARAM list
# @RETURN value of the last element in list
def last (l):
  return l[-1]
# @butlast
# @PARAM list
# @RETURN list without last element
def butlast (le):
  le=list(le)
  le.pop(-1)
  return le
# -------------------------------------------------------------------------------------
# Labs --------------------------------------------------------------------------------
# 9.2 TP9-2 – A PARTIR DES ELEMENTS VUS EN COURS REALISER UN SYSTEME EXPERT
# Il est dit d utiliser des TUPLES et non des LISTES pour les axiomes du systèmes expert.
# Après discussion avec le professeur, le système liste est plus pertinant
# car ne nécessite pas de connaitre le nb d'axiomes. 
# Une règles est donc un tuples d'une liste et d'un string. :)
# ########## DEFINITIONS DES REGLES ########## #
