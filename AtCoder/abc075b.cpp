// https://atcoder.jp/contests/abc075/tasks/abc075_b
// for https://atcoder.jp/contests/apg4b/tasks/APG4b_m

#include <iostream>
using namespace std;

int main() {
  int h, w;
  string s, prev_s, next_s;

  cin >> h >> w;

  cin >> next_s;

  for (int i = 0; i < h; i++) {
    prev_s = s;
    s = next_s;

    if (i < h - 1) cin >> next_s;

    for (int j = 0; j < w; j++) {
      if (s.at(j) == '#') {
        cout << '#';
        continue;
      }

      int count = 0;

      if (i - 1 >= 0 && j - 1 >= 0 && prev_s.at(j-1) == '#') count++;
      if (i - 1 >= 0               && prev_s.at(j) == '#')   count++;
      if (i - 1 >= 0 && j + 1 < w  && prev_s.at(j+1) == '#') count++;
      if (              j - 1 >= 0 && s.at(j-1) == '#')      count++;
      if (              j + 1 < w  && s.at(j+1) == '#')      count++;
      if (i + 1 < h  && j - 1 >= 0 && next_s.at(j-1) == '#') count++;
      if (i + 1 < h                && next_s.at(j) == '#')   count++;
      if (i + 1 < h  && j + 1 < w  && next_s.at(j+1) == '#') count++;

      cout << count;
    }

    cout << endl;
  }
}
