// https://atcoder.jp/contests/abc085/tasks/abc085_b

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, d, x = 0;
  vector<bool> used(100, false);

  cin >> n;

  for (int i = 0; i < n; i++) {
    cin >> d;

    if (used.at(d - 1)) continue;

    x++;
    used.at(d - 1) = true;
  }

  cout << x << endl;

  return 0;
}

