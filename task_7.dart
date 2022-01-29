import 'dart:ffi';

import 'dart:math';

List math_sign = ['+', '-', '/', '*'];
List signIndex = new List.generate(4, (i) => i);
List expression = [];
List showExpression = [];
//List optionIndex = new List.generate(4, (i) => i);
List optionBox = [];

List num1 = new List.generate(9, (i) => i + 1);
List num2 = new List.generate(9, (i) => i + 1);
Random ran = new Random();
void passRandom() {
  num1.shuffle();
  num2.shuffle();
  signIndex.shuffle();
}

int solveMath() {
  if (expression[1] == "+") {
    return expression[0] + expression[2];
  } else if (expression[1] == "-") {
    if (expression[0] > expression[2]) {
      return expression[0] - expression[2];
    } else if (expression[0] < expression[2]) {
      int temp = expression[0];
      expression[0] = expression[2];
      expression[2] = temp;
      return expression[0] - expression[2];
    }
  } else if (expression[1] == "*") {
    return expression[0] * expression[2];
  } else if (expression[1] == "/") {
    if (expression[0] % expression[2] == 0) {
      double result = expression[0] / expression[2];
      return result.toInt();
    } else {
      for (var i = 9; i > 0; i--) {
        if (i % expression[2] == 0) {
          expression[0] = i;
          double result = expression[0] / expression[2];
          return result.toInt();
        }
      }
    }
  }
  return 0;
}

void options(resultValue) {
  var i;
  for (i = 0; i < 3; i++) {
    int value = ran.nextInt(9);
    value *= ran.nextInt(9);
    optionBox.add(value);
  }
  optionBox.add(resultValue);
  optionBox.shuffle();
}

void main() {
  passRandom(); // suffle and generate expression
  expression = [num1[0], math_sign[signIndex[0]], num2[0]];
  int value = solveMath(); //solve expression and give result
  print(expression);
  showExpression = [...expression, '=', value]; // merge complete string
  print(showExpression);
  print(value);
  options(value); // merge options
  print(optionBox); //show in Options
}
