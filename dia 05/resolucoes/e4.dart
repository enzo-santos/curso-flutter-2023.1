import 'dart:async';

Future<void> main() async {
  // Define um controlador de stream
  StreamController<List<String>> streamController =
      StreamController<List<String>>();

  //Ouve qualquer evento lançado na stream
  streamController.stream.listen((event) {
    // Pega todos os nomes de cada evento lançado
    List<String> lengthNomes = event.map((nome) => nome).toList();
    // Imprime
    print(lengthNomes);
  });

  // Adiciona um evento com os nomes
  streamController.sink.add(["Joao", "Maria", "Jose", "Pedro", "Ana"]);

  // Bloqueia a execução por 3 segundos
  await Future.delayed(const Duration(seconds: 3));

  // Adicionar um outro evento com novos nomes
  streamController.sink.add(["Marcia", "Beto", "Patricia", "Maria", "Marcos"]);

  // Bloqueia a execução por 2 segundos - Adicionar um outro evento com novos nomes
  await Future.delayed(
      const Duration(seconds: 2),
      () => streamController.sink
          .add(["Felipe", "Thiago", "Victor", "Larissa", "Thais"]));
}
