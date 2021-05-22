# https://atcoder.jp/contests/abc104/tasks/abc104_c

import math

def search(D, G, p, c, i, num, score):
    min = 10000000

    for j in range(p[i-1] + 1):
        jscore = score + 100 * i * j

        if j == p[i-1]:
            jscore += c[i-1]

        jnum = num + j

        if jscore >= G and jnum < min:
            min = jnum
            break

        if i != D:
            jnum = search(D, G, p, c, i + 1, jnum, jscore)
            if jnum < min:
                min = jnum

    return min

def search2(D, p, c, i, num, rest_score):
    min = float('inf')

    for j in range(0, p[i-1] + 1):
        jscore = 100 * i * j

        if j == p[i-1]:
            jscore += c[i-1]

        jnum = num + j

        if jscore >= rest_score:
            if jnum < min:
                min = jnum

        if i != 1:
            jnum = search2(D, p, c, i - 1, jnum, rest_score - jscore)
            if jnum < min:
                min = jnum

    return min


def search3(D, p, c, i, rest_score):
    min = float('inf')

    for j in range(0, p[i-1] + 1):
        if min <= j:
            break

        jscore = 100 * i * j

        if j == p[i-1]:
            jscore += c[i-1]

        if jscore >= rest_score:
            if j < min:
                min = j

        if i != 1:
            num = j + search3(D, p, c, i - 1, rest_score - jscore)
            if num < min:
                min = num

    return min


# https://img.atcoder.jp/abc104/editorial.pdf
def search4(D, G, p, c):
    min = float('inf')

    for k in range(1 << D):
        score = 0
        count = 0
        incomplete_problems = []

        for i in range(D):
            if k & (1 << i) != 0:
                score += 100 * (i + 1) * p[i] + c[i]
                count += p[i]
            else:
                incomplete_problems.append(i)

        if score < G:
            i = incomplete_problems.pop()

            rest = math.ceil((G - score) / (100 * (i + 1)))

            if rest < p[i]:
                count += rest
            else:
                count = float('inf')

        if count < min:
            min = count

    return min


p = []
c = []

D, G = map(int, input().split())

for i in range(D):
    pi, ci = map(int, input().split())
    p.append(pi)
    c.append(ci)

# print(search(D, G, p, c, 1, 0, 0))
# print(search2(D, p, c, D, 0, G))
# print(search3(D, p, c, D, G))
print(search4(D, G, p, c))
