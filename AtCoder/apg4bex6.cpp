// https://atcoder.jp/contests/apg4b/tasks/APG4b_cq

#include <iostream>

int main() {
  int a, b, ans;
  std::string op;
  std::cin >> a >> op >> b;

  if (("/" == op && 0 == b) || "?" == op || "=" == op || "!" == op) {
    std::cout << "error" << std::endl;
    return 0;
  } else if ("+" == op) {
    ans = a + b;
  } else if ("-" == op) {
    ans = a - b;
  } else if ("*" == op) {
    ans = a * b;
  } else if ("/" == op) {
    ans = a / b;
  }

  std::cout << ans << std::endl;
}
