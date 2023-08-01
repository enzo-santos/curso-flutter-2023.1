import 'dart:async';

void main() {
  final List<String> nomes = ["João", "Maria", "José", "Pedro", "Ana"];

  Stream<List<String>> nomesStream = Stream.value(nomes);

  Stream<List<int>> lengthNomes =
      nomesStream.map((nomes) => nomes.map((nome) => nome.length).toList());

  lengthNomes.toList().then((lengthsList) {
    print('Comprimentos dos nomes: $lengthsList');
  });
}
