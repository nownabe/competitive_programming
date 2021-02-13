def count(L):
    N = len(L)
    c = 0

    for i in range(N):
        for j in range(i + 1, N):
            if L[i] == L[j]:
                continue

            for k in range(j + 1, N):
                if L[k] == L[i] or L[k] == L[j]:
                    continue

                if abs(L[i] - L[j]) < L[k] < L[i] + L[j]:
                    c += 1

    return c

def count2(L):
    N = len(L)
    c = 0

    L = sorted(L)

    for i in range(N - 2):
        for j in range(i + 1, N - 1):
            if L[i] == L[j]:
                continue

            for k in range(j + 1, N):
                if L[j] == L[k]:
                    continue

                if L[k] < L[i] + L[j]:
                    c += 1

    return c


input()
L = list(map(int, input().split()))
print(count2(L))
