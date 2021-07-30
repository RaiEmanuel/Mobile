import 'dart:io';

class Product {
  String name = "defalut";
  double value = 0;

  Product(String name, double value) {
    this.name = name;
    this.value = value;
  }
}

void test(int a) {
  print(a);
  a = 45;
}

void viewProduct(Product p) {
  print("name = ${p.name} & value = ${p.value}");
}

int compareValues(Product p1, Product p2) {
  if (p1.value < p2.value)
    return -1;
  else if (p1.value > p2.value)
    return 1;
  else
    return 0;
}

void main() {
  bool loop = true;
  List<Product> products = [];
  while (loop) {
    print("1 - Cadastro");
    print("2 - Remoção");
    print("3 - Edição");
    print("4 - Busca");
    print("5 - Listagem ordenada");
    print("Digite a opção desejada:");
    int op = int.parse(stdin.readLineSync()!);
    if (op == 0) loop = false;
    switch (op) {
      case 1: //add
        print("Digite o nome:");
        String name = stdin.readLineSync()!;
        print("Digite o valor:");
        double value = double.parse(stdin.readLineSync()!);
        products.add(Product(name, value));
        break;
      case 2: //remove
        /* Deleta todos os registros com mesmo nome */
        print("Digite o nome para remover:");
        String name = stdin.readLineSync()!;
        products.removeWhere((element) => (element.name == name));
        break;
      case 3: //edit
        /* Edita todos os registros com mesmo nome */
        print("Digite o nome para busca:");
        String name = stdin.readLineSync()!;
        var ps = products.where((element) => (element.name == name));
        print("Digite o novo nome para atualização:");
        String newName = stdin.readLineSync()!;
        print("Digite o novo valor para atualização:");
        double newValue = double.parse(stdin.readLineSync()!);
        for (Product p in ps) {
          viewProduct(p);
          p.name = newName;
          p.value = newValue;
          print("Atualizado para ${p}\n===============");
        }
        break;
      case 4: //find
        /* Busca todos os registros com mesmo nome*/
        print("Digite o nome para busca:");
        String name = stdin.readLineSync()!;
        var ps = products.where((element) => (element.name == name));
        for (Product p in ps) viewProduct(p);
        print("=====================");
        break;
      case 5: //list
        //ordenando por valor
        products.sort(compareValues);
        for (Product p in products) viewProduct(p);
        print("============");
        break;
    }
  }
}
