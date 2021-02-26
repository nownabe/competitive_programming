s = input()
p = input()

for i in range(len(s)):
    flag = True

    for j in range(len(p)):
        if s[(i + j) % len(s)] != p[j]:
            flag = False
            break

    if flag:
        break

if flag:
    print('Yes')
else:
    print('No')
