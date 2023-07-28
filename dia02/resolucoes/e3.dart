import 'dart:io';

void main() {
  print("Digite um número: ");
  int numero = int.parse(stdin.readLineSync()!);

  bool condicao1 = numero > 10 && numero < 20;
  bool condicao2 = numero == 0 || numero == 50;
  bool condicao3 = numero != 100 || numero == 200;

  print("O número é maior que 10 e menor que 20? $condicao1");
  print("O número é igual a 0 ou igual a 50? $condicao2");
  print("O número é diferente de 100 ou igual a 200? $condicao3");
}
