// https://atcoder.jp/contests/apg4b/tasks/APG4b_co

#include <bits/stdc++.h>
using namespace std;

int main() {
  int p, n;
  string text;
  int price;

  cin >> p;

  // パターン1
  if (p == 1) {
    cin >> price;
  }

  // パターン2
  if (p == 2) {
    cin >> text >> price;
    cout << text << "!" << endl;
  }

  cin >> n;

  cout << price * n << endl;
}

