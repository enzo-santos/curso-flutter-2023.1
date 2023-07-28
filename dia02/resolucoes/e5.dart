import 'dart:io';

void main() {
  print("Digite um número para representar o dia da semana (1 a 7): ");
  int? dia = int.tryParse(stdin.readLineSync()!);
  if (dia == null) {
    print('Entrada inválida.');
  }

  switch (dia) {
    case 1:
      print("Hoje é segunda-feira");
      break;
    case 2:
      print("Hoje é terça-feira");
      break;
    case 3:
      print("Hoje é quarta-feira");
      break;
    case 4:
      print("Hoje é quinta-feira");
      break;
    case 5:
      print("Hoje é sexta-feira");
      break;
    case 6:
      print("Hoje é sábado");
      break;
    case 7:
      print("Hoje é domingo");
      break;
    default:
      print("Número inválido. Digite um número de 1 a 7.");
  }
}
