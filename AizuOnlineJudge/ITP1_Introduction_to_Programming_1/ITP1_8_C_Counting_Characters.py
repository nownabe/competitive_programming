import sys

small_alphabets = list(map(chr, range(ord('a'), ord('z') + 1)))
large_alphabets = list(map(chr, range(ord('A'), ord('Z') + 1)))
counts = {}

for i in range(len(small_alphabets)):
    counts[small_alphabets[i]] = 0
    counts[large_alphabets[i]] = 0

text = sys.stdin.read()

for c in text:
    if not c in counts:
        continue
    counts[c] += 1

for i in range(len(small_alphabets)):
    print(f'{small_alphabets[i]} : {counts[small_alphabets[i]] + counts[large_alphabets[i]]}')

