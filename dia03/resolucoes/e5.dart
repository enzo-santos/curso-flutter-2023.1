import 'dart:io';

void main() {
  print("Digite o valor original do produto: ");
  double valorOriginal = double.parse(stdin.readLineSync()!);

  print("Valor com desconto: ${(double valorOriginal) {
    double descontoPercentual = 0.1; // 10% de desconto
    double valorComDesconto =
        valorOriginal - (valorOriginal * descontoPercentual);
    return valorComDesconto;
  }(valorOriginal)}");
}
