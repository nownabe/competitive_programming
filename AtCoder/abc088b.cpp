// https://atcoder.jp/contests/abc088/tasks/abc088_b

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n, alice = 0, bob = 0;

  cin >> n;
  vector<int> nums(n);
  vector<bool> used(n, false);

  for (int i = 0; i < n; i++) {
    cin >> nums.at(i);
  }

  for (int i = 0; i < n; i++) {
    int max_idx = -1;

    for (int j = 0; j < n; j++) {
      if (!used.at(j) && (max_idx == -1 || nums.at(j) > nums.at(max_idx))) {
        max_idx = j;
      }
    }

    used.at(max_idx) = true;

    if (i % 2 == 0) {
      alice += nums.at(max_idx);
    } else {
      bob += nums.at(max_idx);
    }
  }

  cout << alice - bob << endl;

  return 0;
}

