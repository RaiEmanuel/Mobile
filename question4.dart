import 'dart:io';

void main() {
  Map<String, int> dictionary = {};
  String input = stdin.readLineSync()!;
  List<String> wordsSplitted = input.split(" ");
  for (String word in wordsSplitted) {
    if (dictionary[word] == null) dictionary[word] = 0;
    int? count = dictionary[word];
    dictionary[word] = count! + 1;
  }

  for (String word in dictionary.keys) {
    print("${word} = ${dictionary[word]}");
  }
}
