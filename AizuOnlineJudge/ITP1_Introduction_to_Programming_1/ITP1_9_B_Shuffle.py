while True:
    deck = input()

    if deck == '-':
        break

    m = int(input())

    for _ in range(m):
        h = int(input())
        deck = deck[h:] + deck[:h]

    print(deck)
