# https://atcoder.jp/contests/arc061/tasks/arc061_a

S = input()

sum = 0

for b in range(1 << len(S)-1):
    b = b | 1 << (len(S)-1)

    prev = 0
    for i in range(0, len(S)):
        if b & 1 << i != 0:
            sum += int(S[prev:i+1])
            prev = i+1

print(sum)
