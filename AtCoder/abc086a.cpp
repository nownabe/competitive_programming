// https://atcoder.jp/contests/abc086/tasks/abc086_a

#include <iostream>
using namespace std;

int main() {
  int a, b;
  cin >> a >> b;

  if (a * b % 2 == 0) {
    cout << "Even" << endl;
  } else {
    cout << "Odd" << endl;
  }
}
