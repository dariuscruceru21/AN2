import numpy as np
import matplotlib.pyplot as plt
import math


# Utility Functions
def generate_random_points_in_square(N):
    return np.random.random((N, 2))


def is_point_in_triangle(P, A, B, C):
    v0, v1, v2 = C - A, B - A, P - A
    dot00, dot01, dot02 = np.dot(v0, v0), np.dot(v0, v1), np.dot(v0, v2)
    dot11, dot12 = np.dot(v1, v1), np.dot(v1, v2)

    denom = dot00 * dot11 - dot01 * dot01
    if denom == 0:
        return False

    inv_denom = 1 / denom
    u, v = (dot11 * dot02 - dot01 * dot12) * inv_denom, (dot00 * dot12 - dot01 * dot02) * inv_denom
    return u >= 0 and v >= 0 and (u + v) <= 1


def plot_square_boundary():
    plt.plot([0, 1, 1, 0, 0], [0, 0, 1, 1, 0], 'k-', label='Unit Square')


# Aufgabe 1 - Birthday Problem Simulation
def aufgabe_1(repetitions=1000000):
    fav_cases = 0
    for _ in range(repetitions):
        birthdays = set(np.random.randint(1, 365, 23))
        if len(birthdays) != 23:
            fav_cases += 1
    estimated_prob = fav_cases / repetitions
    print(f"Aufgabe 1 - Estimated Probability: {estimated_prob:.6f}")
    return estimated_prob


# Aufgabe 2 - Probability and Pi Approximation with Circle
def aufgabe_2(N=1000):
    center = np.array([0.5, 0.5])
    radius = 0.5

    # Generate random points
    X, Y = np.random.random(N), np.random.random(N)
    distances = np.sqrt((X - center[0]) ** 2 + (Y - center[1]) ** 2)
    inside_circle = distances <= radius

    # Plot points inside and outside the circle
    plt.figure()
    plt.gca().set_aspect('equal')
    plt.plot(X[inside_circle], Y[inside_circle], 'bo', label="Inside Circle")
    plt.plot(X[~inside_circle], Y[~inside_circle], 'ro', label="Outside Circle")
    circle = plt.Circle(center, radius, color='g', fill=False)
    plt.gca().add_artist(circle)
    plot_square_boundary()
    plt.title("Random Points Inside and Outside the Circle")
    plt.legend()
    plt.show()

    k = np.sum(inside_circle)
    probability_inside = k / N
    pi_approximation = 4 * probability_inside
    print(f"Aufgabe 2 - Estimated probability: {probability_inside:.6f}")
    print(f"Aufgabe 2 - Approximation of π: {pi_approximation:.6f}")
    return pi_approximation


# Aufgabe 3 - Obtuse Angle Classification
def classify_obtuse_angles(A, vertices):
    def angle_between(v1, v2):
        dot_product = np.dot(v1, v2)
        return np.arccos(dot_product / (np.linalg.norm(v1) * np.linalg.norm(v2))) * (180 / np.pi)

    angles = [angle_between(vertices[i] - A, vertices[(i + 1) % 4] - A) for i in range(4)]
    return sum(1 for angle in angles if angle > 90)


def aufgabe_3(N=1000):
    vertices = np.array([[0, 0], [1, 0], [1, 1], [0, 1]])

    case_1_points, case_2_points = [], []

    for _ in range(N):
        A = np.random.random(2)
        obtuse_count = classify_obtuse_angles(A, vertices)
        if obtuse_count == 1:
            case_1_points.append(A)
        elif obtuse_count == 2:
            case_2_points.append(A)

    # Plot results
    plt.figure()
    plt.gca().set_aspect('equal')
    if case_1_points:
        case_1_points = np.array(case_1_points)
        plt.scatter(case_1_points[:, 0], case_1_points[:, 1], color='blue', label='1 Obtuse Angle', alpha=0.6)
    if case_2_points:
        case_2_points = np.array(case_2_points)
        plt.scatter(case_2_points[:, 0], case_2_points[:, 1], color='red', label='2 Obtuse Angles', alpha=0.6)
    plot_square_boundary()
    plt.title("Random Points with 1 or 2 Obtuse Angles")
    plt.legend()
    plt.show()

    p_case_1 = len(case_1_points) / N
    p_case_2 = len(case_2_points) / N
    print(f"Aufgabe 3 - Probability of exactly 1 obtuse angle: {p_case_1:.4f}")
    print(f"Aufgabe 3 - Probability of exactly 2 obtuse angles: {p_case_2:.4f}")


# Aufgabe 4 - Triangle Simulation
def aufgabe_4(N=500):
    A = np.random.rand(2)
    vertices = {
        'top_left': np.array([0, 1]), 'bottom_left': np.array([0, 0]),
        'top_right': np.array([1, 1]), 'bottom_right': np.array([1, 0])
    }

    A_upper, B_upper, C_upper = vertices['top_left'], vertices['bottom_left'], A
    A_lower, B_lower, C_lower = vertices['bottom_right'], vertices['top_right'], A

    points = generate_random_points_in_square(N)
    inside_triangles, outside_triangles = [], []

    for P in points:
        if is_point_in_triangle(P, A_upper, B_upper, C_upper) or is_point_in_triangle(P, A_lower, B_lower, C_lower):
            inside_triangles.append(P)
        else:
            outside_triangles.append(P)

    inside_triangles = np.array(inside_triangles)
    outside_triangles = np.array(outside_triangles)

    # Plot
    plt.figure()
    plt.gca().set_aspect('equal')
    if inside_triangles.size > 0:
        plt.scatter(inside_triangles[:, 0], inside_triangles[:, 1], color='red', label='Inside Triangles', alpha=0.6)
    if outside_triangles.size > 0:
        plt.scatter(outside_triangles[:, 0], outside_triangles[:, 1], color='blue', label='Outside Triangles',
                    alpha=0.6)
    plot_square_boundary()
    plt.plot([A_upper[0], B_upper[0], C_upper[0], A_upper[0]], [A_upper[1], B_upper[1], C_upper[1], A_upper[1]], 'g-',
             label='Upper Triangle')
    plt.plot([A_lower[0], B_lower[0], C_lower[0], A_lower[0]], [A_lower[1], B_lower[1], C_lower[1], A_lower[1]], 'g-',
             label='Lower Triangle')
    plt.title(f"Random Points Inside and Outside Triangles (A = {A})")
    plt.legend()
    plt.show()

    probability = len(inside_triangles) / N
    print(f"Aufgabe 4 - Probability of point inside triangles: {probability:.4f}")


# Main Function to Execute All Tasks
def main():
    print("Executing Aufgabe 1...")
    aufgabe_1()

    print("Executing Aufgabe 2...")
    aufgabe_2()

    print("Executing Aufgabe 3...")
    aufgabe_3()

    print("Executing Aufgabe 4...")
    aufgabe_4()


# Execute main if this script is run
main()