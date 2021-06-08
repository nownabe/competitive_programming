// https://atcoder.jp/contests/apg4b/tasks/APG4b_bz

#include <iostream>
#include <unordered_map>

int main() {
  int n;

  std::cin >> n;

  std::unordered_map<int, uint64_t> counter;
  counter[-1] = 0;

  int max = -1, a;

  for (int i = 0; i < n; i++) {
    std::cin >> a;
    counter[a]++;

    if (counter[a] > counter[max]) {
      max = a;
    }
  }

  std::cout << max << " " << counter[max] << std::endl;

  return 0;
}

