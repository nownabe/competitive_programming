# https://atcoder.jp/contests/abc088/tasks/abc088_d

# Input:
#   2 <= H <= 50
#   2 <= W <= 50

from collections import deque


DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]


def search(h, w, board, whites):
    visited = [[False] * w for _ in range(h)]
    distances = [[None] * w for _ in range(h)]

    visited[0][0] = True
    distances[0][0] = 1

    todo = deque([(0, 0)])

    while len(todo) != 0:
        vi, vj = todo.popleft()

        for di, dj in DIRECTIONS:
            wi, wj = (vi + di, vj + dj)

            if 0 <= wi < h and 0 <= wj < w and board[wi][wj] == '.':
                if visited[wi][wj]:
                    continue

                distances[wi][wj] = distances[vi][vj] + 1

                if (wi, wj) == (h - 1, w - 1):
                    return whites - distances[wi][wj]

                visited[wi][wj] = True
                todo.append((wi, wj))

    return -1


H, W = map(int, input().split())

board = []
whites = 0

for _ in range(H):
    row = list(input())
    whites += row.count('.')
    board.append(row)

print(search(H, W, board, whites))
