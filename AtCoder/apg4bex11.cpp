// https://atcoder.jp/contests/apg4b/tasks/APG4b_cl

#include <iostream>

int main() {
  int n, a, b;
  std::string op;

  std::cin >> n;
  std::cin >> a;

  for (int i = 0; i < n; i++) {
    std::cin >> op >> b;

    if (op == "/" && b == 0) {
      std::cout << "error" << std::endl;
      break;
    }

    if (op == "+") {
      a += b;
    } else if (op == "-") {
      a -= b;
    } else if (op == "*") {
      a *= b;
    } else if (op == "/") {
      a /= b;
    }

    std::cout << i + 1 << ":" << a << std::endl;
  }
}
