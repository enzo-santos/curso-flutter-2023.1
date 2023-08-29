import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _Estado {
  int count;
  List<String> items;

  _Estado({required this.count, required this.items});
}

class _Bloc extends Cubit<_Estado> {
  _Bloc() : super(_Estado(count: 0, items: []));

  void incrementa() {
    int count = state.count;
    emit(_Estado(count: count + 1, items: state.items));
  }

  void adiciona() {
    List<String> items = state.items.toList();
    items.add('abc');
    emit(_Estado(count: state.count, items: items));
  }
}

class TelaBloc extends StatelessWidget {
  const TelaBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _Bloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    _Bloc bloc = context.read<_Bloc>();
                    bloc.incrementa();
                  },
                  child: const Text('adicionar'),
                ),
                Expanded(
                  child: BlocSelector<_Bloc, _Estado, List<String>>(
                    selector: (estado) => estado.items,
                    builder: (context, items) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          String item = items[i];
                          return Text(item);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
