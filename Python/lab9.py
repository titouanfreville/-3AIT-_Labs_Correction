###############################################################
############ AUTHOR FREVILLE TITOUAN - ID 217821 ##############
#### Feel free to use this to improve, but don't copy them ####
###############################################################

# Python tested using SublimeREPL on Ubuntu ;) 
# Labs --------------------------------------------------------------------------------
# TP 9 - Les Programmes Pythons -------------------------------------------------------
# TP 9 - Interpreteur et fonctionnel en python
# @car
# @PARAM list
# @RETURN first element
def car (l):
  return l[0]
# @cdr
# @PARAM list
# @RETURN list without head
def cdr (l):
  return l[1:]
# @last
# @PARAM list
# @RETURN value of the last element in list
def last (l):
  return l[-1]
# @butlast
# @PARAM list
# @RETURN list without last element
def butlast (l):
  return l[:-1]

liste=[0,1,2,3,4,5]
print liste
print car (liste)
print cdr (liste)
print last (liste)
print butlast (liste)

# @last_element_from_start
# @PARAM list
# @RETURN last element from the list (going through all the list)
def last_element_from_start (liste):
  l=list(liste)
  while len(l)>1:
    l=cdr(l)
  return car(l)

# I hate simple exercices ... xD
def last_element_from_end (liste):
  return last(liste)

print last_element_from_start (liste)
print last_element_from_end (liste)
# @carre
# @PARAM n
# @RETURN n*n
def carre (n):
  return n*n

# @carre
# @PARAM n
# @RETURN n*n*n
def cube(n):
  return n*carre(n)

print carre(2)
print cube(2)

# @somme
# @PARAM n1 n2
# @RETURN n1+n2
def somme (n1,n2):
  return n1+n2

print somme(1,2)

# The 2 following function already exist ;) But let's play with here 
# @membre
# @PARAM list,element
# @RETURN true if e in list, false else
def membre(liste,e):
  l=list(liste)
  if len(l) > 0 : 
    return (car(l) == e or membre(cdr(l),e))
  else:
    return False

# @ERROR : ElementUnkow
# Error to be return when element searched is not in list
class ElementUnkow(Exception):
  def __init__(self, value):
    self.value = value
  def __str__(self):
    return repr(self.value)
# @position
# @PARAM list,element
# @RETURN index of element if element exist
# @RAISE ElementUnknow if element was not in list
def position(liste,e):
  l=list(liste)
  if len(l) > 0 :
    if (car(l)==e):
      return 0
    else:
      return 1 + position(cdr(l),e)
  else:
    raise ElementUnkow('Element '+str(e)+' was not in list.')

# Test
print membre(liste,2)
print membre(liste,100)
print position(liste,2)
# print position(liste,100) 

# Identique : 
# V1 : Number of elements equals to one in parameter 
# @identique_ins
# @PARAM list, element
# @RETURN number of instance of element
def identique_ins(liste,e):
  l=list(liste)
  if len(l) > 0 :
    if (car(l)==e):
      return 1+identique_ins(cdr(l),e)
    else:
      return identique_ins(cdr(l),e)
  else:
    return 0
# Identique : 
# V2: Number of elements who appear multiple times in list
# @remove_e_list
# @PARAM list,e
# @RETURN list without e
def remove_all_e_list(liste,e):
  l=list(liste)
  while membre(l,e):
    l.remove(e)
  return l

# @identique_els
# @PARAM list
# @RETURN number of element with multiple occurence in list
def identique_els(liste):
  l=list(liste)
  if len(l) > 0 :
    if (membre(cdr(l),car(l))):
      return 1+identique_els(remove_all_e_list(l,car(l)))
    else:
      return identique_els(cdr(l))
  else:
    return 0

# test
l2=[1,2,1,2,3,1,2,3,4,1,2,3,4,5]
print identique_ins(l2,2)
print identique_ins(l2,100)
print identique_els(l2)
print identique_els(liste)
# -------------------------------------------------------------------------------------