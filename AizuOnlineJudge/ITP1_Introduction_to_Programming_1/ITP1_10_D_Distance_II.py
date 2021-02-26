import math

input()
X = list(map(int, input().split()))
Y = list(map(int, input().split()))

sum1 = 0
sum2 = 0
sum3 = 0
max_diff = -1001

for i in range(len(X)):
    abs_diff = abs(X[i] - Y[i])

    sum1 += abs_diff
    sum2 += abs_diff ** 2
    sum3 += abs_diff ** 3

    if max_diff < abs_diff:
        max_diff = abs_diff


# p = 1 Manhattan distance

print(sum1)


# p = 2 Euclidean distance

print(math.sqrt(sum2))


# p = 3

print(sum3 ** (1/3))


# p = inf

print(max_diff)
