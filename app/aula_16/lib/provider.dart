import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _Estado extends ChangeNotifier {
  int count = 0;
  List<String> items = [];

  void incrementa() {
    count += 1;
    notifyListeners();
  }

  void adiciona() {
    items.add('abc');
    notifyListeners();
  }
}

class TelaProvider extends StatelessWidget {
  const TelaProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _Estado(),
      builder: (context, child) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<_Estado>(
                builder: (context, estado, _) {
                  print('renderizando estado global');
                  return const Icon(Icons.star);
                },
              ),
              Selector<_Estado, int>(
                selector: (context, estado) => estado.count,
                builder: (context, count, _) {
                  print('renderizando estado.count');
                  return Text('$count');
                },
              ),
              Selector<_Estado, List<String>>(
                selector: (context, estado) => estado.items.toList(),
                builder: (context, items, _) {
                  print('renderizando estado.items');
                  return Text('${items.length} ($items)');
                },
              ),
              MaterialButton(
                child: const Text('Incrementa'),
                onPressed: () {
                  context.read<_Estado>().incrementa();
                },
              ),
              MaterialButton(
                child: const Text('Adiciona'),
                onPressed: () {
                  context.read<_Estado>().adiciona();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
