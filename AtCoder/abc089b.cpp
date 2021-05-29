// https://atcoder.jp/contests/abc089/tasks/abc089_b

#include <iostream>
using namespace std;

int main() {
  int n;
  int p = 0, w = 0, g = 0, y = 0;
  string s;

  cin >> n;

  for (int i = 0; i < n; i++) {
    cin >> s;

    if (s == "P") {
      p++;
    } else if (s == "W") {
      w++;
    } else if (s == "G") {
      g++;
    } else if (s == "Y") {
      y++;
    }
  }

  if (p == 0 || w == 0 || g == 0 || y == 0) {
    cout << "Three" << endl;
  } else {
    cout << "Four" << endl;
  }
}
