# https://atcoder.jp/contests/arc037/tasks/arc037_b

# Input:
#   N: nodes ( 2 <= N <= 100)
#   M: edges ( 1 <= M <= N*(N-1)/2 )


class DFS:
    def __init__(self, graph):
        self.graph = graph

        self.going = [False] * len(graph)
        self.returning = [False] * len(graph)
        self.is_tree = True

    def search(self, v, parent=None):
        if self.returning[v]:
            return

        self.going[v] = True

        for w in self.graph[v]:
            if parent is not None and w == parent:
                continue

            if self.going[w] and not self.returning[w]:
                self.is_tree = False

            if self.going[w]:
                continue

            self.search(w, v)

        self.returning[v] = True


def search(graph):
    visited = [False] * len(graph)
    count = 0

    for v in range(len(graph)):
        if visited[v]:
            continue

        dfs = DFS(graph)
        dfs.search(v)

        for i, g in enumerate(dfs.going):
            if g:
                visited[i] = True

        if dfs.is_tree:
            count += 1

    return count


N, M = map(int, input().split())

graph = [set() for _ in range(N)]

for _ in range(M):
    v1, v2 = map(int, input().split())

    graph[v1-1].add(v2-1)
    graph[v2-1].add(v1-1)

print(search(graph))
