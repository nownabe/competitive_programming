input()

A = list(map(int, input().split()))

count = 0

while True:
    flag = True

    for i, Ai in enumerate(A):
        if Ai & 0b1 == 1:
            flag = False
            break

        A[i] = Ai >> 1

    if flag:
        count += 1
    else:
        break

print(count)
