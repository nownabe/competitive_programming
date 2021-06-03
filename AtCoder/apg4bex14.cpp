// https://atcoder.jp/contests/apg4b/tasks/APG4b_ci

#include <algorithm>
#include <iostream>

int main() {
  int a, b, c;

  std::cin >> a >> b >> c;

  std::cout << std::max(a, std::max(b, c)) - std::min(a, std::min(b, c)) << std::endl;

  return 0;
}

