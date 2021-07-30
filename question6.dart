import 'dart:io';

//armazenar a tabela de huffman para evitar pesquisas na arvore
Map<String, String> mapHuffman = Map();
//palavra final codificada
List<String> digest = [];

class Node {
  String? id = "";
  Node? left = null, right = null;

  Node(String id) {
    this.id = id;
  }
}

class BinaryTree {
  Node? root;
  int? cumulativeFrequency = 0;

  BinaryTree(Node root) {
    this.root = root;
  }
}

int compareTrees(BinaryTree treeA, BinaryTree treeB) {
  return treeA.cumulativeFrequency! - treeB.cumulativeFrequency!;
}

void depthFirst(Node root, List<String> code) {
  if (root.left == null && root.right == null) {
    print("leaf ${root.id}: ${code.join("")}");
    mapHuffman[root.id!] = code.join("");
    return;
  }
  if (root.left != null) {
    code.add("0");
    depthFirst(root.left!, code);
    code.removeLast();
  }
  if (root.right != null) {
    code.add("1");
    depthFirst(root.right!, code);
    code.removeLast();
  }
}

void main() {
  String? text = "ABRACADABRA";
  print("Digite a palavra a ser codificada: ");
  text = stdin.readLineSync()!;
  List<String>? splitedText = text.split("");
  //conta frequencia de cada letra
  Map<String, int> frequencys = Map();

  for (String letter in splitedText) {
    if (frequencys[letter] == null) frequencys[letter] = 0;
    frequencys[letter] = frequencys[letter]! + 1;
  }
  //lista com arvores ordenadas pela frequencia para gerar arvore Huffman
  List<BinaryTree> huffmanTree = [];
  //gerando a arvore
  for (String key in frequencys.keys) {
    //criando os nos individuais de chave key
    Node root = new Node(key);
    BinaryTree biTree = new BinaryTree(root);
    //atribui a frequencia da arvore como sendo a frequencia de leitura do caractere individual
    biTree.cumulativeFrequency = frequencys[key]!;
    huffmanTree.add(biTree);
  }
  //a arvore que restar sera a huffman para codificacao e decodificacao
  while (huffmanTree.length > 1) {
    //ordena para pegar as duas subarvores de menor frequencia
    huffmanTree.sort(compareTrees);
    //pega arvores de menor frequencia para fazer o join
    BinaryTree treeA = huffmanTree.removeAt(0);
    BinaryTree treeB = huffmanTree.removeAt(0);
    //nova raiz da arvore de join
    Node root = new Node("intern");
    //define filhos como sendo as raizes das subarvore resgatadas
    root.left = treeA.root;
    root.right = treeB.root;
    //nova arvore de join
    BinaryTree newTree = new BinaryTree(root);
    //seta frequencia da nova arvore como sendo a soma das frequencias das arvores resgatadas
    newTree.cumulativeFrequency =
        treeA.cumulativeFrequency! + treeB.cumulativeFrequency!;
    //devolve arvore corrigida
    huffmanTree.add(newTree);
  }
  print(frequencys);
  BinaryTree tree =
      huffmanTree.removeAt(0); //pega arvore restante minima (huffman)
  depthFirst(tree.root!, []);
  for (String letter in splitedText) {
    digest.add(mapHuffman[
        letter]!); //coloca na string codificada o codigo huffman da letra lida
  }
  print("${text} = ${digest.join("")}");
}
