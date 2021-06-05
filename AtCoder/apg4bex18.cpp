// https://atcoder.jp/contests/apg4b/tasks/APG4b_ce

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, m, a, b;

  cin >> n >> m;

  vector<vector<string>> results(n, vector<string>(n, "-"));

  for (int i = 0; i < m; i++) {
    cin >> a >> b;
    results.at(a - 1).at(b - 1) = "o";
    results.at(b - 1).at(a - 1) = "x";
  }

  for (vector<string> row: results) {
    for (int i = 0; i < row.size(); i++) {
      cout << row.at(i);
      if (i != row.size() - 1) cout << " ";
    }
    cout << endl;
  }

  return 0;
}

