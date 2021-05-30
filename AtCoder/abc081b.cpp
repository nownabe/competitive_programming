// https://atcoder.jp/contests/abc081/tasks/abc081_b

#include <iostream>
using namespace std;

int main() {
  int n, a, min = 100;

  cin >> n;

  for (int i = 0; i < n; i++) {
    cin >> a;

    int cnt = 0;
    while (a % 2 == 0) {
      cnt++;
      a /= 2;
    }

    if (cnt < min) min = cnt;
  }

  cout << min << endl;
}
