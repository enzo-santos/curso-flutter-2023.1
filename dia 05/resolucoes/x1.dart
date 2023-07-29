import 'dart:async';

Future<void> main() async {
  // Define um controlador de stream
  StreamController<List<String>> streamController =
      StreamController<List<String>>();

  //ATENÇÃO AQUI
  //Ouve todos os eventos da stream EM QUALQUER MOMENTO.
  streamController.stream.listen((event) {
    // Aloca todos os nomes do evento atual
    List<String> nomes = event.map((nome) => nome).toList();
    // Imprime lengthNomes atual
    print(nomes);
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
