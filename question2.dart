import 'dart:math';
import 'dart:io';

void main() {
  //(-b +- sqrt(delta))2a
  //delta = b^2 -4ac
  List<List<int>> matrix = [];
  for (var i = 0; i < 5; i++) {
    //5 linhas
    matrix.add([1, 2, 3, 4, 5]);
  }

  for (var row in matrix) {
    for (var element in row) {
      print(element);
    }
  }
}
