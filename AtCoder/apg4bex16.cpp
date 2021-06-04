// https://atcoder.jp/contests/apg4b/tasks/APG4b_cg

#include <bits/stdc++.h>

using namespace std;

int main() {
  int prev, curr;

  cin >> prev;

  for (int i = 0; i < 4; i++) {
    cin >> curr;

    if (prev == curr) {
      cout << "YES" << endl;
      return 0;
    }

    prev = curr;
  }

  cout << "NO" << endl;

  return 0;
}

