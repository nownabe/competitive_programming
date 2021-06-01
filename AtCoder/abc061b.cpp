// https://atcoder.jp/contests/abc061/tasks/abc061_b

#include <iostream>
#include <vector>
using namespace std;

int main() {
  int n, m, a, b;

  cin >> n >> m;

  vector<int> roads(n, 0);

  for (int i = 0; i < m; i++) {
    cin >> a >> b;
    roads.at(a - 1)++;
    roads.at(b - 1)++;
  }

  for (int i = 0; i < n; i++) {
    cout << roads.at(i) << endl;
  }
}
