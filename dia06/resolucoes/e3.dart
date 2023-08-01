// Seu chefe pediu para que houvesse suporte para ler os dados de um site. Para 
// iniciar a implementação, você deverá ler os itens de um mapa, de chaves 
// `String` e valores `List<String>`.
import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado',
    ],
    'Pratos principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelos',
    ],
    'Aperitivos': [
      'Bolinhos de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese',
    ],
  };

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Minhas receitas')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (MapEntry<String, List<String>> entry in dados.entries)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    entry.key,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String valor in entry.value)
                      Text(
                        valor,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                  ],
                ),
              ],
            ),
        ],
      ),
    ),
  ));
}
