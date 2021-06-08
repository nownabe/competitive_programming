// https://atcoder.jp/contests/apg4b/tasks/APG4b_ca

#include <iostream>
#include <vector>
#include <algorithm>

int main() {
  int n;
  std::cin >> n;

  std::vector<std::pair<int, int>> pairs(n);

  for (int i = 0; i < n; i++) {
    int a, b;
    std::cin >> a >> b;
    pairs.at(i) = std::make_pair(b, a);
  }

  std::sort(pairs.begin(), pairs.end());

  for (auto pair: pairs) {
    std::cout << pair.second << " " << pair.first << std::endl;
  }

  return 0;
}

