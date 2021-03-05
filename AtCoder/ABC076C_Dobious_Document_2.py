# https://atcoder.jp/contests/abc076/tasks/abc076_c


def search(sd, t):
    if len(sd) < len(t):
        return 'UNRESTORABLE'

    for i in range(len(sd) - len(t), -1, -1):
        t_part = sd[i:i+len(t)]
        ok = True

        for j in range(len(t)):
            if t_part[j] != '?' and t_part[j] != t[j]:
                ok = False
                break

        if ok:
            return (sd[0:i] + t + sd[i+len(t):]).replace('?', 'a')

    return 'UNRESTORABLE'


Sd = input()
T = input()

print(search(Sd, T))
