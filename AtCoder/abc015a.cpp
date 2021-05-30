// https://atcoder.jp/contests/abc015/tasks/abc015_1

#include <iostream>
using namespace std;

int main() {
  string a, b;

  cin >> a >> b;

  if (a.size() > b.size()) {
    cout << a << endl;
  } else {
    cout << b << endl;
  }
}
