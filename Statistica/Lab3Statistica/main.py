import random
from collections import Counter
from random import randrange

import numpy
from matplotlib import pyplot as plt
from matplotlib.pyplot import bar, show, hist, grid, legend ,xticks



#Aufgabe1
n = 1000

count_A = 0
count_B = 0
count_A_und_B = 0

for _ in range(n):
    kugeln = random.sample(['r', 'b', 'g'], counts=[6, 4, 6], k=3)

    if "r" in kugeln:
        count_A += 1

        if len(set(kugeln)) == 1:
            count_A_und_B += 1

    if len(set(kugeln)) == 1:
        count_B += 1


P_A = count_A / n
P_B = count_B / n
P_A_und_B = count_A_und_B / n
P_B_given_A = P_A_und_B / P_A if P_A > 0 else 0

print("P(A) =", P_A)
print("P(B) =", P_B)
print("P(A_und_B) =", P_A_und_B)
print("P(B_given_A) =", P_B_given_A)


#Aufgabe 2

N = 500
daten = [randrange(1,7) for _ in range(N)]
# print(daten)
z, count = numpy.unique(daten, return_counts=True)
d = dict([(z[i],count[i]/N)for i in range(0,6)])
print("Zahl und relative Haufigkeit:",d)
bar(z,count/N,width=0.9,color="red",edgecolor="black",label="relative Haufigkeit")
bar(z,1/6,width=0.7,color="blue",edgecolor="black",label="...")
legend(loc="lower left")
xticks(range(0,7))
grid()
show()


#Aufgabe 3

def simulate_dice_sum_game(N=1000):
    sums = [sum(random.choices(range(1, 7), k=3)) for _ in range(N)]  # Simulate N three-dice sums
    frequencies = Counter(sums)
    rel_frequencies = {s: frequencies[s] / N for s in frequencies.keys()}  # Relative frequencies

    # Plotting theoretical probabilities for comparison
    possible_sums = range(3, 19)
    theoretical_probs = [count_sum_prob(s) for s in possible_sums]  # Calculated theoretical probabilities

    plt.bar(frequencies.keys(), [rel_frequencies[s] for s in frequencies.keys()],
            width=0.9, color='red', edgecolor='black', label="Simulated Frequencies")
    plt.bar(possible_sums, theoretical_probs, width=0.7, color='blue', edgecolor='black', label="Theoretical Frequencies", alpha=0.5)
    plt.legend(loc="upper right")
    plt.grid()
    plt.show()

    # Best number(s) to bet on
    max_prob_sum = max(rel_frequencies, key=rel_frequencies.get)
    return max_prob_sum, theoretical_probs[max_prob_sum - 3] if 3 <= max_prob_sum <= 18 else None


def count_sum_prob(sum_val):
    # Helper function to compute theoretical probability of a three-dice sum
    outcomes = [(i, j, k) for i in range(1, 7) for j in range(1, 7) for k in range(1, 7)]
    favorable_outcomes = sum(1 for outcome in outcomes if sum(outcome) == sum_val)
    return favorable_outcomes / 216



#Aufgabe 4
def estimate_p1_p2_p3(N=10000):
    c1 = c2 = a1 = a2 = 0  # Counters for the specified conditions
    A = list(range(1, 21))  # Numbers 1 to 20
    for _ in range(N):
        v = random.choice(A)
        c1 += (v % 2 != 0)  # Odd numbers
        c2 += (v % 2 == 0)  # Even numbers
        a1 += (v % 2 != 0) and (v % 3 == 0)  # Odd and divisible by 3
        a2 += (v % 2 == 0) and (6 <= v <= 10)  # Even and between 6 and 10 inclusive

    # Calculating probabilities
    p1 = a1 / c1 if c1 > 0 else 0
    p2 = a2 / c2 if c2 > 0 else 0
    p3 = c1 / N  # Probability of choosing an odd number

    return p1, p2, p3


#Aufgabe 5
def birthday_simulation(N=10000):
    favorable = 0
    for _ in range(N):
        birthdays = [random.randint(1, 12) for _ in range(5)]  # Random months for 5 people
        counts = Counter(birthdays)
        if list(counts.values()).count(2) == 1 and list(counts.values()).count(1) == 3:
            favorable += 1

    probability = favorable / N
    return probability


#Aufgabe 6
def dice_sum_simulation(N=10000):
    favorable_a = favorable_b = total_a = total_b = 0  # Counters for conditions and favorable outcomes
    for _ in range(N):
        first_roll, second_roll = random.randint(1, 6), random.randint(1, 6)
        sum_rolls = first_roll + second_roll

        # Condition a: first roll is 4
        if first_roll == 4:
            total_a += 1
            if sum_rolls >= 7:
                favorable_a += 1

        # Condition b: second roll is even
        if second_roll % 2 == 0:
            total_b += 1
            if sum_rolls >= 7:
                favorable_b += 1

    p_a = favorable_a / total_a if total_a > 0 else 0  # P(Sum >= 7 | First roll is 4)
    p_b = favorable_b / total_b if total_b > 0 else 0  # P(Sum >= 7 | Second roll is even)

    return p_a, p_b


#print("Assignment 3:",simulate_dice_sum_game(N))
print("Assignment 4:",estimate_p1_p2_p3(N))
#print("Assignment 5:",birthday_simulation(N))
#print("Assignment 6:",dice_sum_simulation(N))
