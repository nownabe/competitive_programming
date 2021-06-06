// https://atcoder.jp/contests/apg4b/tasks/APG4b_cc

#include <bits/stdc++.h>

using namespace std;

int count_children(vector<int> &parents, int v) {
  int sum = 1;

  for (int i = 0; i < parents.size(); i++) {
    if (parents[i] == v) sum += count_children(parents, i);
  }

  return sum;
}

int main() {
  int n;

  cin >> n;

  vector<int> parents(n);
  parents.at(0) = -1;

  for (int i = 1; i < n; i++) {
    cin >> parents.at(i);
  }

  for (int i = 0; i < n; i++) {
    cout << count_children(parents, i) << endl;
  }

  return 0;
}

