def determine(w, h, x, y, r):
    if x - r < 0 or x + r > w:
        return False

    if y - r < 0 or y + r > h:
        return False

    return True

w, h, x, y, r = input().split()

if determine(int(w), int(h), int(x), int(y), int(r)):
    print('Yes')
else:
    print('No')
