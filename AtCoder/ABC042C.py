# https://atcoder.jp/contests/abc042/tasks/arc058_a


def solve(N, K, D):
    nums = [i for i in range(10)]

    for d in D:
        nums.remove(d)

    num_min = str(min(nums))

    ans = ""
    flag = False

    for i, ns in enumerate(reversed(str(N))):
        n = int(ns)

        if n not in nums or flag:
            flag = False
            upper_nums = [num for num in nums if num > n]

            if len(upper_nums) == 0:
                flag = True
            else:
                nm = min(upper_nums)
                ans = str(nm) + num_min * i
        else:
            ans = str(n) + ans

    if ans == "":
        return str(min([num for num in nums if num > 0])) + num_min * len(str(N))
    else:
        return ans


def solve2(N, K, D):
    ds = list(map(str, D))

    def check(n):
        for c in str(n):
            if c in ds:
                return False

        return True

    for n in range(N, 10 * N):
        if check(n):
            return n


N, K = map(int, input().split())
D = list(map(int, input().split()))

print(solve2(N, K, D))
