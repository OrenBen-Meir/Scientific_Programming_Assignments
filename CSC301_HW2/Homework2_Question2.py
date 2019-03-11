def newton_interp_coefficients(x_list, y_list):
    # Returns an array of coefficients used for a newton polynomial for sets of points (x_list[i], y_list[i])
    # for all i such that i>=0 and i<len(x_list)
    # the program used divided differences and dynamic programing
    if len(x_list) != len(y_list):
        raise ValueError
    n = len(x_list)
    div_diff_matrix = n * [None]
    for i in range(n):
        div_diff_matrix[i] = [y_list[i]] + i * [0]
    for i in range(1, n):
        for j in range(i, n):
            div_diff_matrix[j][i] = (div_diff_matrix[j][i - 1] - div_diff_matrix[j - 1][i - 1]) / (
                        x_list[j] - x_list[j - i])
    newton_coefficients = n * [None]
    for i in range(n):
        newton_coefficients[i] = div_diff_matrix[i][i]
    return newton_coefficients


def linspace_list(low, up, length):
    # functions the same as linspace in matlab but for lists in python
    new_list = []
    step = (up - low) / float(length)
    for i in range(length):
        new_list.append(low)
        low = low + step
    return new_list


with open('Homework2_question2.txt', 'w') as f:
    max_n = 65
    n = 2

    def func(t):
        return 1 / (1 + t * t)
    while n <= max_n:
        X = linspace_list(-5, 5, n)
        Y = [None] * len(X)
        for i in range(len(Y)):
            Y[i] = func(X[i])
        C = newton_interp_coefficients(X, Y)
        f.write("n = " + str(n) + "\ncoefficients = " + str(C) + '\n\n')
        n = 2 * n
