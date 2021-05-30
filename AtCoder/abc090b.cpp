// https://atcoder.jp/contests/abc090/tasks/abc090_b

#include <iostream>
using namespace std;

int main() {
  int a, b, count = 0;

  cin >> a >> b;

  for (int i = a; i <= b; i++) {
    int d1 = i / 10000;
    int d2 = (i / 1000) % 10;
    int d4 = (i / 10) % 10;
    int d5 = i % 10;

    if (d1 == d5 && d2 == d4) count++;
  }

  cout << count << endl;
}
