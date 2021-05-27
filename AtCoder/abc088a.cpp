// https://atcoder.jp/contests/abc088/tasks/abc088_a

#include <iostream>
using namespace std;

int main() {
  int n, a;

  cin >> n >> a;

  if (n % 500 <= a) {
    cout << "Yes" << endl;
  } else {
    cout << "No" << endl;
  }
}
