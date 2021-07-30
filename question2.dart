import 'dart:io';

void main() {
  int rows, columns;
  print("Digite o número de linhas: ");
  rows = int.parse(stdin.readLineSync()!);
  print("Digite o número de colunas: ");
  columns = int.parse(stdin.readLineSync()!);

  var matrix = []; //cria linhas

  for (int i = 0; i < rows; ++i) {
    matrix.add([]); //cria colunas
    for (int j = 0; j < columns; ++j) {
      print("matrix[${i}][${j}]");
      matrix[i].add(stdin.readLineSync()!);
    }
  }
  /*
    1 2 3
    4 5 6
    */

  //print(matrix);
  for (var row in matrix) {
    print(row);
  }
}
