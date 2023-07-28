import 'dart:io';
import 'dart:math';

void main() {
  int numeroSecreto = Random().nextInt(10) + 1;

  int tentativasMaximas = 3;
  int tentativasFeitas = 0;
  bool acertou = false;

  print("Bem-vindo ao jogo 'Adivinhe o número'!");
  print("Tente adivinhar o número secreto entre 1 e 10.");
  print("Você tem $tentativasMaximas tentativas.");

  while (tentativasFeitas < tentativasMaximas) {
    print("Tentativa ${tentativasFeitas + 1}: Digite um número:");
    String? input = stdin.readLineSync();

    // Verificar se a entrada é válida (número inteiro)
    if (input == null || !isNumeric(input)) {
      print("Por favor, digite um número válido.");
      continue;
    }

    int numeroTentativa = int.parse(input);

    if (numeroTentativa == numeroSecreto) {
      acertou = true;
      break;
    } else if (numeroTentativa < numeroSecreto) {
      print("Tente um número maior.");
    } else {
      print("Tente um número menor.");
    }

    tentativasFeitas++;
  }

  if (acertou) {
    print("Parabéns! Você acertou o número secreto $numeroSecreto!");
  } else {
    print("Fim do jogo. O número secreto era $numeroSecreto.");
  }
}

bool isNumeric(String str) {
  // Função auxiliar para verificar se uma string é numérica (inteira)
  return int.tryParse(str) != null;
}
