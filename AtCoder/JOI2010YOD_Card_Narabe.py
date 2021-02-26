# https://atcoder.jp/contests/joi2010yo/tasks/joi2010yo_d

# Input:
#   4 <= n <= 10
#   2 <= k <= 4


from itertools import permutations


def search(n, k, cards):
    numbers = set()

    for selected_cards in permutations(cards, k):
        numbers.add(''.join(map(str, selected_cards)))

    return len(numbers)


n = int(input())
k = int(input())

cards = []

for _ in range(n):
    cards.append(int(input()))

print(search(n, k, cards))
