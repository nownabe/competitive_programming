n = int(input())

cards = {
    'S': [False for _ in range(13)],
    'H': [False for _ in range(13)],
    'C': [False for _ in range(13)],
    'D': [False for _ in range(13)],
}

for i in range(n):
    suit, rank = input().split()
    cards[suit][int(rank)-1] = True

for s in ['S', 'H', 'C', 'D']:
    for rank, ok in enumerate(cards[s]):
        if not ok:
            print(f'{s} {rank+1}')

