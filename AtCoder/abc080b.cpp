// https://atcoder.jp/contests/abc080/tasks/abc080_b

#include <iostream>
using namespace std;

int main() {
  int n, m, sum = 0;

  cin >> n;

  m = n;
  while (m > 0) {
    sum += m % 10;
    m = m / 10;
  }

  if (n % sum == 0) {
    cout << "Yes" << endl;
  } else {
    cout << "No" << endl;
  }
}
