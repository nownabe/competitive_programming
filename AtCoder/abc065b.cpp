// https://atcoder.jp/contests/abc065/tasks/abc065_b

#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n, next, i = 0, count = 0;

  cin >> n;

  vector<int> a(n);
  vector<bool> pushed(n, false);

  for (int i = 0; i < n; i++) {
    cin >> a.at(i);
  }

  i = 0;
  while (true) {
    next = a.at(i) - 1;
    count++;

    if (pushed.at(next)) {
      cout << -1 << endl;
      break;
    }

    if (next == 1) {
      cout << count << endl;
      break;
    }

    pushed.at(next) = true;
    i = next;
  }
}
