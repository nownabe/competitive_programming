// https://atcoder.jp/contests/abc107/tasks/abc107_b

#include <bits/stdc++.h>

using namespace std;

int main() {
  int h, w;

  cin >> h >> w;

  vector<string> input(h);

  for (int i = 0; i < h; i++) {
    cin >> input.at(i);
  }

  vector<string> next;
  bool flag = true;

  while (flag) {
    flag = false;
    next = vector<string>(0);

    for (int i = 0; i < input.size(); i++) {
      bool white_only = true;

      for (char c: input.at(i)) {
        if (c == '#') {
          white_only = false;
          break;
        }
      }

      if (white_only) {
        flag = true;
      } else {
        next.push_back(input.at(i));
      }
    }

    input = next;
    next = vector<string>(input.size());

    for (int i = 0; i < input.at(0).size(); i++) {
      bool white_only = true;

      for (string row: input) {
        if (row.at(i) == '#') {
          white_only = false;
          break;
        }
      }

      if (white_only) {
        flag = true;
      } else {
        for (int j = 0; j < input.size(); j++) {
          next.at(j) = next.at(j) + input.at(j).at(i);
        }
      }
    }

    input = next;
  }

  for (string row: input) {
    cout << row << endl;
  }

  return 0;
}

