# https://atcoder.jp/contests/arc005/tasks/arc005_3


from collections import deque


DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]


def search(h, w, board, start):
    destructions = [[3] * w for _ in range(h)]
    destructions[start[0]][start[1]] = 0
    queue = deque([start])

    while len(queue) != 0:
        vi, vj = queue.popleft()

        for di, dj in DIRECTIONS:
            wi, wj = (vi + di, vj + dj)

            if 0 <= wi < h and 0 <= wj < w:
                if board[wi][wj] == 'g':
                    return True

                next_count = destructions[vi][vj]

                if board[wi][wj] == '#':
                    next_count += 1

                if next_count > 2:
                    continue

                if next_count < destructions[wi][wj]:
                    destructions[wi][wj] = next_count
                    queue.append((wi, wj))

    return False


H, W = map(int, input().split())

board = []
start = None

for i in range(H):
    row = input()

    if 's' in row:
        start = (i, row.index('s'))

    board.append(row)

if search(H, W, board, start):
    print('YES')
else:
    print('NO')
