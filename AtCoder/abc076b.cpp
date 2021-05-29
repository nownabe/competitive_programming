// https://atcoder.jp/contests/abc076/tasks/abc076_b

#include <iostream>
using namespace std;

int main() {
  int n, k, d;

  cin >> n >> k;

  d = 1;

  for (int i = 0; i < n; i++) {
    if (d < k) {
      d *= 2;
    } else {
      d += k;
    }
  }

  cout << d << endl;
}
