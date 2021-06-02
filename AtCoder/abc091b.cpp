// https://atcoder.jp/contests/abc091/tasks/abc091_b

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, m;

  cin >> n;
  vector<string> blues(n);

  for (int i = 0; i < n; i++) {
    cin >> blues.at(i);
  }

  cin >> m;
  vector<string> reds(m);

  for (int i = 0; i < m; i++) {
    cin >> reds.at(i);
  }

  int max = 0;

  for (int i = 0; i < n; i++) {
    int count = 0;

    for (int j = 0; j < n; j++) {
      if (blues.at(i) == blues.at(j)) count++;
    }

    for (int j = 0; j < m; j++) {
      if (blues.at(i) == reds.at(j)) count--;
    }

    if (count > max) max = count;
  }

  cout << max << endl;
}
