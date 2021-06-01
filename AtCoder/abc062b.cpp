// https://atcoder.jp/contests/abc062/tasks/abc062_b

#include <iostream>

int main() {
  int h, w;
  std::string line;

  std::cin >> h >> w;

  for (int i = 0; i < w + 2; i++) {
    std::cout << "#";
  }
  std::cout << std::endl;

  for (int i = 0; i < h; i++) {
    std::cout << "#";
    std::cin >> line;
    std::cout << line << "#" << std::endl;
  }

  for (int i = 0; i < w + 2; i++) {
    std::cout << "#";
  }
  std::cout << std::endl;
}
