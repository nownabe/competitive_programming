n = int(input())

taro_score = 0
hanako_score = 0

for _ in range(n):
    taro_card, hanako_card = input().split()

    if taro_card > hanako_card:
        taro_score += 3
    elif taro_card < hanako_card:
        hanako_score += 3
    else:
        taro_score += 1
        hanako_score += 1

print(f'{taro_score} {hanako_score}')
