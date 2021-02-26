n, m, l = map(int, input().split())

A = []

for _ in range(n):
    A.append(list(map(int, input().split())))

B = []

for _ in range(m):
    B.append(list(map(int, input().split())))

for i in range(n):
    ci = []
    for j in range(l):
        cij = 0
        for k in range(m):
            cij += A[i][k] * B[k][j]
        ci.append(str(cij))
    print(' '.join(ci))

