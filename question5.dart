import 'dart:io';

bool isAnagram(Map<String, int> dictionary1, Map<String, int> dictionary2) {
  //compara se quantidades são iguais
  for (String key in dictionary1.keys) {
    if (dictionary1[key] != dictionary2[key] || dictionary2[key] == null) {
      print(("diferentes"));
      return false;
    }
  }
  return true;
}

void main() {
  Map<String, int> dictionary1 = {}, dictionary2 = {};
  print("Lendo palavra 1: ");
  String word1 = stdin.readLineSync()!;
  print("Lendo palavra 2: ");
  String word2 = stdin.readLineSync()!;
  List<String> lettersWord1 = word1.split(""), lettersWord2 = word2.split("");

  //conta letras da palavra 1
  for (String word in lettersWord1) {
    if (dictionary1[word] == null) dictionary1[word] = 0;
    int? count = dictionary1[word];
    dictionary1[word] = count! + 1;
  }

  //conta letras da palavra 2
  for (String word in lettersWord2) {
    if (dictionary2[word] == null) dictionary2[word] = 0;
    int? count = dictionary2[word];
    dictionary2[word] = count! + 1;
  }

  if (isAnagram(dictionary1, dictionary2))
    print("uma é anagrama da outra");
  else
    print("uma não é anagrama da outra");
}
