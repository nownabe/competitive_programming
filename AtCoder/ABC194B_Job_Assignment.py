# https://atcoder.jp/contests/abc194/tasks/abc194_b

N = int(input())

a = []
b = []
c = []

for i in range(N):
    ai, bi = map(int, input().split())
    a.append((ai, i))
    b.append((bi, i))
    c.append(ai + bi)

a.sort()
b.sort()

min1_a = a[0]
min1_b = None
for bi, i in b:
    if i != min1_a[1]:
        min1_b = (bi, i)
        break

min2_b = b[0]
min2_a = None
for ai, i in a:
    if i != min2_b[1]:
        min2_a = (ai, i)
        break

ab = min(max(min1_a[0], min1_b[0]), max(min2_a[0], min2_b[0]))
print(min(ab, min(c)))
