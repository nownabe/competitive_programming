# https://atcoder.jp/contests/agc033/tasks/agc033_a


from collections import deque


DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]


def search(h, w, board, whites):
    count = 0
    changed = 0

    while changed < whites:
        previous = [[board[i][j] for j in range(w)] for i in range(h)]

        for i in range(h):
            for j in range(w):
                if previous[i][j] == '.':
                    continue

                for di, dj in DIRECTIONS:
                    vi, vj = (i + di, j + dj)

                    if 0 <= vi < h and 0 <= vj < w and board[vi][vj] == '.':
                        board[vi][vj] = '#'
                        changed += 1

        count += 1

    return count


def search2(h, w, board):
    queue = deque()
    distances = [[-1] * w for _ in range(h)]

    for i in range(h):
        for j in range(w):
            if board[i][j] == '#':
                queue.append((i, j))
                distances[i][j] = 0

    while len(queue) != 0:
        vi, vj = queue.popleft()

        for di, dj in DIRECTIONS:
            wi, wj = (vi + di, vj + dj)

            if 0 <= wi < h and 0 <= wj < w and distances[wi][wj] == -1:
                distances[wi][wj] = distances[vi][vj] + 1
                queue.append((wi, wj))

    return max([max(d) for d in distances])


H, W = map(int, input().split())

board = []
whites = 0

for _ in range(H):
    row = list(input())
    whites += row.count('.')
    board.append(row)

print(search2(H, W, board))
