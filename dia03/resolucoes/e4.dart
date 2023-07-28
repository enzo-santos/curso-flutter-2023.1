import 'dart:io';

double calcularMedia(List<double> notas) {
  double soma = 0;

  for (var nota in notas) {
    soma += nota;
  }

  return soma / notas.length;
}

void main() {
  List<double> notas = [];

  print(
      "Digite as notas dos estudantes (digite a palavra 'fim' encerra o programa): ");
  String? input = stdin.readLineSync();

  while (input != "fim") {
    double nota = double.parse(input!);
    notas.add(nota);
    input = stdin.readLineSync();
  }

  double media = calcularMedia(notas);
  print("Média das notas: $media");
}
