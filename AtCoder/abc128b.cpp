// https://atcoder.jp/contests/abc128/tasks/abc128_b

#include <bits/stdc++.h>

using namespace std;

int main() {
  int n;
  cin >> n;

  vector<tuple<string, int, int>> restaurants(n);

  for (int i = 0; i < n; i++) {
    string s;
    int p;

    cin >> s >> p;
    restaurants.at(i) = make_tuple(s, 100 - p, i + 1);
  }

  sort(restaurants.begin(), restaurants.end());

  for (auto restaurant: restaurants) {
    cout << get<2>(restaurant) << endl;
  }

  return 0;
}

