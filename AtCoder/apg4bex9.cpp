// https://atcoder.jp/contests/apg4b/tasks/APG4b_cn

#include <iostream>

int main() {
  int x, a, b;

  std::cin >> x >> a >> b;

  std::cout << ++x << std::endl;

  x *= (a + b);
  std::cout << x << std::endl;

  x *= x;
  std::cout << x << std::endl;

  std::cout << --x << std::endl;
}
