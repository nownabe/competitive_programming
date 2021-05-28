// https://atcoder.jp/contests/apg4b/tasks/APG4b_cm

#include <iostream>

int main() {
  int a, b;
  std::cin >> a >> b;

  int i = 0;

  std::cout << "A:";

  while (i++ < a) {
    std::cout << "]";
  }

  std::cout << std::endl << "B:";

  i = 0;
  while (i++ < b) {
    std::cout << "]";
  }

  std::cout << std::endl;
}
