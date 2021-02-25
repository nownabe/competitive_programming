# https://atcoder.jp/contests/abc054/tasks/abc054_c

# Input:
#   N: Number of nodes (2 <= N <= 8)
#   M: Number of edges (0 <= M <= N(N-1)/2)


from collections import deque


def search(n, m, graph):
    routes = set()
    queue = deque([[0]])

    while len(queue) != 0:
        route = queue.popleft()

        if len(route) == n:
            routes.add(''.join(map(str, route)))
            continue

        v = route[-1]

        for w in graph[v]:
            if w in route:
                continue

            queue.append(route + [w])

    return len(routes)


N, M = map(int, input().split())

graph = [set() for _ in range(N)]

for _ in range(M):
    a, b = map(int, input().split())

    graph[a - 1].add(b - 1)
    graph[b - 1].add(a - 1)

print(search(N, M, graph))

