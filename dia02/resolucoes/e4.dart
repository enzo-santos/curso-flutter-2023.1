import 'dart:io';

void main() {
  print("Digite sua idade: ");
  int idade = int.parse(stdin.readLineSync()!);

  if (idade >= 18) {
    print("Você é maior de idade");
  } else {
    print("Você é menor de idade");
  }
}
