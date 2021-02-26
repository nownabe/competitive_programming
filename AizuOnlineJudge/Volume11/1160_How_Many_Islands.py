# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1160&lang=jp

DIRECTIONS = [
    (-1, -1), (-1, 0), (-1, 1), (0, -1),
    (0, 1), (1, -1), (1, 0), (1, 1)
]


def count_islands(islands, w, h):
    count = 0
    visited = [[False] * w for _ in range(h)]

    for i in range(h):
        for j in range(w):
            if visited[i][j] or islands[i][j] == 0:
                continue

            todo = []
            todo.append((i, j))
            visited[i][j] = True

            while len(todo) != 0:
                vi, vj = todo.pop()

                for di, dj in DIRECTIONS:
                    wi = vi + di
                    wj = vj + dj

                    if 0 <= wi < h and 0 <= wj < w and islands[wi][wj] == 1:
                        if visited[wi][wj]:
                            continue

                        visited[wi][wj] = True
                        todo.append((wi, wj))

            count += 1

    return count

while True:
    w, h = map(int, input().split())

    if w == 0 and h == 0:
        break

    islands = []

    for _ in range(h):
        islands.append(list(map(int, input().split())))

    print(count_islands(islands, w, h))
