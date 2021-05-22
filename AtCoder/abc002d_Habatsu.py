# https://atcoder.jp/contests/abc002/tasks/abc002_4

# Input:
#   1 <= N <= 12
#   0 <= M <= N(N-1)/2


def is_faction(relations, candidates):
    for i in candidates:
        for j in candidates:
            if i == j:
                continue

            if j not in relations[i]:
                return False

    return True

def search(N, M, relations):
    max_num = 0

    for b in range(1 << N):
        candidates = []

        for i in range(N):
            if b & (1 << i) != 0:
                candidates.append(i)

        if is_faction(relations, candidates):
            if len(candidates) > max_num:
                max_num = len(candidates)

    return max_num


N, M = map(int, input().split())

relations = [set() for _ in range(N)]

for i in range(M):
    x, y = map(int, input().split())
    relations[x - 1].add(y - 1)
    relations[y - 1].add(x - 1)

print(search(N, M, relations))
