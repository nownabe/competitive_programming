// https://atcoder.jp/contests/apg4b/tasks/APG4b_ck

#include <iostream>

int main() {
  int sum = 1;
  std::string s;
  std::cin >> s;

  for (int i = 1; i < s.size(); i += 2) {
    if (s.at(i) == '+') {
      sum++;
    } else {
      sum--;
    }
  }

  std::cout << sum << std::endl;
}
