# https://atcoder.jp/contests/abc195/tasks/abc195_b

import math

A, B, W = map(int, input().split())

W *= 1000

min_c = math.ceil(W/B)
max_c = math.floor(W/A)

if min_c > max_c:
    print("UNSATISFIABLE")
else:
    print(min_c, max_c)
