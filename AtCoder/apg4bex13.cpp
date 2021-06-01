// https://atcoder.jp/contests/apg4b/tasks/APG4b_cj

#include <iostream>
#include <vector>

int main() {
  int n, average, sum = 0;

  std::cin >> n;

  std::vector<int> scores(n);

  for (int i = 0; i < n; i++) {
    std::cin >> scores.at(i);
    sum += scores.at(i);
  }

  average = sum / n;

  for (int i = 0; i < n; i++) {
    if (average > scores.at(i)) {
      std::cout << average - scores.at(i) << std::endl;
    } else {
      std::cout << scores.at(i) - average << std::endl;
    }
  }
}
