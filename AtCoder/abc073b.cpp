// https://atcoder.jp/contests/abc073/tasks/abc073_b

#include <iostream>
using namespace std;

int main() {
  int n, l, r, sum = 0;

  cin >> n;

  for (int i = 0; i < n; i++) {
    cin >> l >> r;

    sum += r - l + 1;
  }

  cout << sum << endl;
}
