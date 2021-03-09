# https://atcoder.jp/contests/abc005/tasks/abc005_3


def search(t, a, b):
    if len(a) < len(b):
        return False

    i = 0
    for bj in b:
        ok = False
        for k in range(i, len(a)):
            if a[k] <= bj and a[k] + t >= bj:
                i = k + 1
                ok = True
                break

        if not ok:
            return False

    return True


T = int(input())
input()
A = list(map(int, input().split()))
input()
B = list(map(int, input().split()))

if search(T, A, B):
    print('yes')
else:
    print('no')
