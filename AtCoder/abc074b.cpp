// https://atcoder.jp/contests/abc074/tasks/abc074_b

#include <iostream>
using namespace std;

int main() {
  int n, k, x, sum = 0;

  cin >> n >> k;

  for (int i = 0; i < n; i++) {
    cin >> x;
    if (x < k - x) {
      sum += x * 2;
    } else {
      sum += (k - x) * 2;
    }
  }

  cout << sum << endl;
}
