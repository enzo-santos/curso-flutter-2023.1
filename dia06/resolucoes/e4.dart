// Seu chefe pediu em seguida que houvesse suporte para filtros, onde o usuário 
// poderia escolher qual categoria ele gostaria de ver apenas. Para iniciar a 
// implementação, além de ler os itens de um mapa, você deverá ler um `int` de 1
// a 3, que pode ser nulo. Caso este número seja nulo, todas as categorias 
// deverão ser exibidas. Caso contrário, apenas a categoria indicada pelo seu 
// valor deverá ser exibida.
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
  final int? categoria = null;

  final List<MapEntry<String, List<String>>> entries = dados.entries.toList();
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Minhas receitas')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < entries.length; i++)
            if (categoria == null || categoria == i + 1)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      entries[i].key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (String valor in entries[i].value)
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