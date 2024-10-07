import random
import math
import itertools
from random import sample
import more_itertools
from more_itertools.more import distinct_combinations, distinct_permutations

# help("random.sample")
# help("math.factorial")
# print(math.perm(4, 4))
# print(math.perm(4,2))

# 1 Generarea tutror permutarilor a lui "sicher
# a = "sicher"
#
# p = itertools.permutations(a)
#  for i in list(p):
#      print("".join(i))
#

# 2 Doua permutari random
# print(random.sample(list(p),2))

# 3
# a = ["s", "i", "c", "h", "e" , "r"]
# total = itertools.permutations(a,2)
# i = 0
# for aranjament in list(itertools.permutations(a,2)):
#     print("".join(aranjament))
#     i += 1
# print(i)

# 4
# a = "Mathe"
# print(math.perm(len(a),3))

# 5
# a = "Mathe"
# c = itertools.combinations(a,3)
# for i in c:
#     print(i)

# 6
# a = "Mathe"
# print(math.comb(len(a),3))

# 7
# M = list(distinct_permutations("AABB"))
# print(M)
# m = len(M)
# print("Anzahl Permutationen von AABB mit Wiederholung:", m)
#
# N = list(distinct_permutations("1112"))
# for p in distinct_permutations("1112"):
#     print("".join(p))
# print("Anzahl Permutationen von 1112 mit Wiederholung", len(N))

# 8
# print("Alle Kombinationen von ABC je 2, mit Wiederholung")
# M = list(itertools.combinations_with_replacement("ABC",2))
# for m in M:
#     print("".join(m))
# print("Azahl Kombinationen von ABC je 2 mit Wiederholung:",len(M))

# 9
# l1 = [1, 2, 3, 4]
# n = 6
# M = itertools.combinations_with_replacement(l1,n)
# a = 0
# for i in M:
#     print(i)
#     a += 1
# print(a)
