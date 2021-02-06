n, x = map(int, input().split())
A = map(int, input().split())

arr = []

for a in A:
    if a != x:
        arr.append(str(a))

print(' '.join(arr))
