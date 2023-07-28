import 'dart:io';

void main() {
  print("Digite o preço máximo: ");
  int precoMaximo = int.parse(stdin.readLineSync()!);

  List<int> precos = [1, 2, 3, 4, 5, 6];

  List<int> precosPares = precos
      .where((element) => element <= precoMaximo && element % 2 == 0)
      .toList();

  print(precosPares);
}
