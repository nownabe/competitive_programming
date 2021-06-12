// https://atcoder.jp/contests/apg4b/tasks/APG4b_bw

#include <cctype>
#include <iostream>
#include <unordered_map>
#include <vector>

using namespace std;

string to_string(vector<int> vec) {
  string buf = "[";
  for (int val: vec) {
    buf += to_string(val);
    buf += ", ";
  }
  buf += "]";
  return buf;
}

string to_string(unordered_map<char, int> int_vars) {
  string buf = "{";

  for(auto pair: int_vars) {
    buf += pair.first;
    buf += ": ";
    buf += to_string(pair.second);
    buf += ", ";
  }

  buf += "}";

  return buf;
}

string to_string(unordered_map<char, vector<int>> &vec_vars) {
  string buf = "{";

  for(auto pair: vec_vars) {
    buf += pair.first;
    buf += ": [";

    for (int val: pair.second) {
      buf += to_string(val);
      buf += ", ";
    }

    buf += "], ";
  }

  buf += "}";

  return buf;
}

int int_val(unordered_map<char, int> &int_vars, string &token) {
  return isdigit(token.at(0)) ? stoi(token) : int_vars.at(token.at(0));
}

int int_statement(unordered_map<char, int> &int_vars, vector<string> &tokens) {
  int val;

  string buf;
  string op;

  for (string token: tokens) {
    if (token == "+" || token == "-" || token == ";") {
      int val2 = int_val(int_vars, buf);

      if (op == "+") {
        val += val2;
      } else if (op == "-") {
        val -= val2;
      } else {
        val = val2;
      }

      op = token;
    } else {
      buf = token;
    }
  }

  return val;
}

vector<int> vec_val(unordered_map<char, int> &int_vars, unordered_map<char, vector<int>> &vec_vars, vector<string> &tokens) {
  if (tokens.size() == 1) { // variable
    return vec_vars.at(tokens.at(0).at(0));
  }

  // literal

  vector<int> vec;

  for (string token: tokens) {
    if (token == "[" || token == "]" || token == ",") continue;

    vec.push_back(int_val(int_vars, token));
  }

  return vec;
}

vector<int> vec_plus(vector<int> &vec1, vector<int> &vec2) {
  vector<int> vec(vec1.size());

  for (int i = 0; i < vec1.size(); i++) {
    vec.at(i) = vec1.at(i) + vec2.at(i);
  }

  return vec;
}

vector<int> vec_minus(vector<int> &vec1, vector<int> &vec2) {
  vector<int> vec(vec1.size());

  for (int i = 0; i < vec1.size(); i++) {
    vec.at(i) = vec1.at(i) - vec2.at(i);
  }

  return vec;
}

vector<int> vec_statement(unordered_map<char, int> &int_vars, unordered_map<char, vector<int>> &vec_vars, vector<string> &tokens) {
  vector<int> vec;

  string op;
  vector<string> buf;

  for (string token: tokens) {
    if (token == "+" || token == "-" || token == ";") {
      if (op == "+") {
        auto vec2 = vec_val(int_vars, vec_vars, buf);
        vec = vec_plus(vec, vec2);
      } else if (op == "-") {
        auto vec2 = vec_val(int_vars, vec_vars, buf);
        vec = vec_minus(vec, vec2);
      } else {
        vec = vec_val(int_vars, vec_vars, buf);
      }

      op = token;
      buf = vector<string>();
    } else {
      buf.push_back(token);
    }
  }

  return vec;
}

void command_int(unordered_map<char, int> &int_vars, vector<string> &operand) {
  char name = operand.at(0).at(0);
  vector<string> tokens(operand.begin() + 2, operand.end());
  int val = int_statement(int_vars, tokens);
  int_vars[name] = val;
}

void command_print_int(unordered_map<char, int> &int_vars, vector<string> &operand) {
  int val = int_statement(int_vars, operand);
  cout << val << endl;
}

void command_vec(unordered_map<char, int> &int_vars, unordered_map<char, vector<int>> &vec_vars, vector<string> &operand) {
  char name = operand.at(0).at(0);
  vector<string> tokens(operand.begin() + 2, operand.end());
  auto vec = vec_statement(int_vars, vec_vars, tokens);
  vec_vars[name] = vec;
}

void command_print_vec(unordered_map<char, int> &int_vars, unordered_map<char, vector<int>> &vec_vars, vector<string> &operand) {
  vector<int> vec = vec_statement(int_vars, vec_vars, operand);
  cout << "[ ";
  for (int val: vec) {
    cout << val << " ";
  }
  cout << "]" << endl;
}

void exec_command(unordered_map<char, int> &int_vars, unordered_map<char, vector<int>> &vec_vars, string &command) {
  string opcode = "";
  vector<string> operand;

  string buf;

  for (char c: command) {
    if (c == ' ') {
      if (opcode == "") {
        opcode = buf;
      } else {
        operand.push_back(buf);
      }
      buf = "";
    } else {
      buf += c;
    }
  }
  operand.push_back(buf);

  if (opcode == "int") {
    command_int(int_vars, operand);
  } else if (opcode == "print_int") {
    command_print_int(int_vars, operand);
  } else if (opcode == "vec") {
    command_vec(int_vars, vec_vars, operand);
  } else if (opcode == "print_vec") {
    command_print_vec(int_vars, vec_vars, operand);
  }
}

int main() {
  int n;
  cin >> n;

  unordered_map<char, int> int_vars;
  unordered_map<char, vector<int>> vec_vars;

  string command;

  getline(cin, command);

  for (int i = 0; i < n; i++) {
    getline(cin, command);

    exec_command(int_vars, vec_vars, command);
  }

  return 0;
}
