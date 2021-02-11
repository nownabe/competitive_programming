def reverse(s):
    return s[::-1]

words = list(map(reverse, ['dream', 'dreamer', 'erase', 'eraser']))

def check(S):
    S = reverse(S)

    pos = 0

    while pos < len(S):
        w = None
        for word in words:
            if S[pos:].startswith(word):
                w = word
                break

        if w is None:
            return False
        else:
            pos += len(word)

    return True


S = input()

if check(S):
    print('YES')
else:
    print('NO')

