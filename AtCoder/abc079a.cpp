// https://atcoder.jp/contests/abc079/tasks/abc079_a

#include <iostream>
using namespace std;

int main() {
  string n;

  cin >> n;

  if (n[0] == n[1] && n[1] == n[2]) {
    cout << "Yes" << endl;
  } else if (n[1] == n[2] && n[2] == n[3]) {
    cout << "Yes" << endl;
  } else {
    cout << "No" << endl;
  }
}
