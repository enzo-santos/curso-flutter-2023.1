import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Pedido {
  final int id;
  final int idUsuario;
  final String titulo;
  final bool completo;

  const Pedido({
    required this.id,
    required this.idUsuario,
    required this.titulo,
    required this.completo,
  });
}

Future<Pedido> criarPedido() async {
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/todos/1');
  Response resposta = await get(url);
  String conteudo = resposta.body;

  Map dados = jsonDecode(conteudo);
  return Pedido(
    id: dados['id'],
    idUsuario: dados['userId'],
    titulo: dados['title'],
    completo: dados['completed'],
  );
}

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  Pedido? pedidoAtual;

  @override
  void initState() {
    super.initState();
    criarPedido().then((pedido) {
      setState(() {
        pedidoAtual = pedido;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Pedido? pedido = pedidoAtual;
    return Scaffold(
      body: pedido == null 
        ? const Center(child: Text('Carregando...'))
        : Center(child: Text(pedido.titulo)),
    );
  }
}
