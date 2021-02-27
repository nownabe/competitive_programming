# https://atcoder.jp/contests/joi2008yo/tasks/joi2008yo_a

def search(amount):
    otsuri = 1000 - amount
    count = 0

    for coin in [500, 100, 50, 10, 5]:
        if otsuri >= coin:
            count += otsuri // coin
            otsuri = otsuri % coin

    return count + otsuri

print(search(int(input())))
