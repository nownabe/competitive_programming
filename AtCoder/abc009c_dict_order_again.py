# https://atcoder.jp/contests/abc009/tasks/abc009_3

def search(n, k, s):
    from collections import Counter

    counter_s = Counter(s)

    def count_diff(s1, s2):
        count = 0
        for i in range(len(s1)):
            if s1[i] != s2[i]:
                count += 1

        return count

    def count_same_chars(chars1, chars2):
        chars1 = list(chars1)[:]
        chars2 = list(chars2)[:]

        if len(chars1) < len(chars2):
            chars1, chars2 = chars2, chars1

        count = 0

        for c in chars1:
            if c in chars2:
                chars2.remove(c)
                count += 1

        return count

    def is_able_to_add(t, c, sorted_s):
        if counter_s[c] <= Counter(t)[c]:
            return False

        diff1 = count_diff(t + c, s[:len(t) + 1])

        rest_s = s[len(t) + 1:]
        rest_sorted = sorted_s[:]
        rest_sorted.remove(c)
        diff2 = len(rest_s) - count_same_chars(rest_s, rest_sorted)

        if diff1 + diff2 <= k:
            return True

    sorted_s = list(sorted(s))
    t = ''

    for i in range(n):
        for c in sorted_s:
            if is_able_to_add(t, c, sorted_s):
                t += c
                sorted_s.remove(c)
                break

    return t


N, K = map(int, input().split())
S = input()

print(search(N, K, S))
