// https://atcoder.jp/contests/abc079/tasks

#include <iostream>
#include <vector>

std::vector<int64_t> memo(87, -1);

uint64_t lucas(int n) {
  if (n == 0) return 2;
  if (n == 1) return 1;

  if (memo.at(n) != -1) {
    return memo.at(n);
  }

  int64_t ans = lucas(n - 1) + lucas(n - 2);
  memo.at(n) = ans;

  return ans;
}

int main() {
  int n;

  std::cin >> n;

  std::cout << lucas(n) << std::endl;

  return 0;
}

