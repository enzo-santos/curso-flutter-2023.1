```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Tela(),
    ),
  );
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  String busca = '';

  @override
  Widget build(BuildContext context) {
    List<String> categorias = [
      'Sobremesas',
      'Pratos principais',
      'Aperitivos',
    ];
    List<String> nomesPratos = [
      'Prato A',
      'Prato B',
      'Prato C',
    ];
    nomesPratos =
        nomesPratos.where((nomePrato) => nomePrato.contains(busca)).toList();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              initialValue: busca,
              onChanged: (valor) {
                setState(() {
                  busca = valor;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar prato',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          for (String categoria in categorias)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Secao(
                titulo: categoria,
                nomesPratos: nomesPratos,
              ),
            ),
        ],
      ),
    );
  }
}

class Secao extends StatelessWidget {
  final String titulo;
  final List<String> nomesPratos;

  const Secao({
    super.key,
    required this.titulo,
    required this.nomesPratos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (String nomePrato in nomesPratos)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CardPrato(
                  nome: nomePrato,
                  icone: const Icon(Icons.restaurant),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class CardPrato extends StatelessWidget {
  final String nome;
  final Icon icone;

  const CardPrato({
    super.key,
    required this.nome,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bool? resultado = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TelaDescricao(
              nomePrato: nome,
            ),
          ),
        );
        if (resultado == null) {
          print('Usuário apenas visualizou.');
        } else {
          print('Usuário selecionou: $resultado');
        }
      },
      child: Column(
        children: [
          icone,
          Text(nome),
        ],
      ),
    );
  }
}

class TelaDescricao extends StatelessWidget {
  final String nomePrato;

  const TelaDescricao({super.key, required this.nomePrato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(nomePrato)),
      body: Column(
        children: [
          const Text('Olá, mundo!'),
          TextButton(
            child: const Text('fazer pedido'),
            onPressed: () {
              Navigator.pop(context, true);
            },
          ),
          TextButton(
            child: const Text('cancelar pedido'),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
          TextButton(
            child: const Text('voltar'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

```
