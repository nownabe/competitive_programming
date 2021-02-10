A = int(input()) # 500
B = int(input()) # 100
C = int(input()) # 50
X = int(input())

count = 0

for a in range(A + 1):
    rest1 = X - 500 * a

    if rest1 == 0:
        count += 1
        break
    elif rest1 < 0:
        break

    for b in range(B + 1):
        rest2 = rest1 - 100 * b

        if rest2 == 0:
            count += 1
            break
        elif rest2 < 0:
            break

        for c in range(C + 1):
            rest3 = rest2 - 50 * c

            if rest3 == 0:
                count += 1
                break
            elif rest3 < 0:
                break

print(count)
