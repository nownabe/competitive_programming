// https://atcoder.jp/contests/apg4b/tasks/APG4b_cf

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, s, p, count = 0;

  cin >> n >> s;

  vector<int> apple(n);

  for (int i = 0; i < n; i++) {
    cin >> apple.at(i);
  }

  for (int i = 0; i < n; i++) {
    cin >> p;

    for (int j = 0; j < n; j++) {
      if (p + apple.at(j) == s) count++;
    }
  }

  cout << count << endl;

  return 0;
}

