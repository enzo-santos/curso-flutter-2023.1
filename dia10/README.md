```dart
import 'package:flutter/material.dart';

class Categoria {
  final String nome;
  final List<Prato> pratos;

  const Categoria({required this.nome, required this.pratos});
}

class Prato {
  final String nome;
  final double preco;

  const Prato({required this.nome, required this.preco});
}

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
    List<Categoria> categorias = const [
      Categoria(
        nome: 'Sobremesas',
        pratos: [
          Prato(nome: 'Torta', preco: 20),
          Prato(nome: 'Sorvete', preco: 15),
          Prato(nome: 'Pizza', preco: 40),
        ],
      ),
      Categoria(
        nome: 'Pratos principais',
        pratos: [
          Prato(nome: 'Strogonoff', preco: 20),
          Prato(nome: 'Arroz', preco: 15),
          Prato(nome: 'Salada', preco: 40),
        ],
      ),
      Categoria(
        nome: 'Aperitivos',
        pratos: [
          Prato(nome: 'Empada', preco: 20),
          Prato(nome: 'Pastel', preco: 15),
          Prato(nome: 'Doce', preco: 40),
        ],
      ),
    ];

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
          for (Categoria categoria in categorias)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Secao(
                titulo: categoria.nome,
                pratos: categoria.pratos
                    .where((prato) => prato.nome.contains(busca))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class Secao extends StatelessWidget {
  final String titulo;
  final List<Prato> pratos;

  const Secao({
    super.key,
    required this.titulo,
    required this.pratos,
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
            for (Prato prato in pratos)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: CardPrato(
                  prato: prato,
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
  final Prato prato;
  final Icon icone;

  const CardPrato({
    super.key,
    required this.prato,
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
              prato: prato,
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
          Text(prato.nome),
        ],
      ),
    );
  }
}

class TelaDescricao extends StatelessWidget {
  final Prato prato;

  const TelaDescricao({super.key, required this.prato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(prato.nome)),
      body: Column(
        children: [
          Text('${prato.preco}'),
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
