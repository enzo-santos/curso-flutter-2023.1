import 'dart:io';

void main() {
  print("Digite o primeiro número inteiro: ");
  int numero1 = int.parse(stdin.readLineSync()!);

  print("Digite o segundo número inteiro: ");
  int numero2 = int.parse(stdin.readLineSync()!);

  int soma = numero1 + numero2;
  int subtracao = numero1 - numero2;
  int multiplicacao = numero1 * numero2;
  double divisao = numero1 / numero2;
  int resto = numero1 % numero2;

  print("Soma: $soma");
  print("Subtração: $subtracao");
  print("Multiplicação: $multiplicacao");
  print("Divisão: $divisao");
  print("Resto da Divisão: $resto");
}
