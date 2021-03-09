# https://atcoder.jp/contests/abc083/tasks/arc088_a

import math

X, Y = map(int, input().split())

# print(math.floor(math.log2(Y / X) + 1))

count = 0
x = X

while True:
    if x > Y:
        break

    count += 1
    x *= 2

print(count)

