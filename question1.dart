import 'dart:math';
import 'dart:io';

void main() {
  //(-b +- sqrt(delta))2a
  //delta = b^2 -4ac
  print("Calculando funções do segundo grau...");
  double a, b, c;
  print("digite a:");
  a = double.parse(stdin.readLineSync()!);
  print("digite b:");
  b = double.parse(stdin.readLineSync()!);
  print("digite c:");
  c = double.parse(stdin.readLineSync()!);
  //double delta = pow(b, 2) - 4 * a * c;
  double delta = pow(b, 2) - 4 * a * c;
  if (delta < 0) {
    print("Desculpe, mas não calculamos raízes complexas. Delta = ${delta}");
  } else if (delta > 0) {
    print("Há duas raízes reais bem definidas. Delta = ${delta}");
    double x1 = (-b + sqrt(delta)) / 2 * a;
    double x2 = (-b - sqrt(delta)) / 2 * a;
    print("x1 = ${x1} e x2 = ${x2}");
  } else {
    print("As duas raízes reais são iguais");
    double x1 = (-b + sqrt(delta)) / 2 * a;
    double x2 = (-b - sqrt(delta)) / 2 * a;
    print("x1 = ${x1} e x2 = ${x2}");
  }
}
