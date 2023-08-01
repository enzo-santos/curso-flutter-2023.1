// Para finalizar, seu chefe pediu que houvesse suporte para buscas por texto, 
// onde o usuário poderia inserir um texto *T* e serem exibidas apenas as 
// receitas cujos nomes contém *T* como substring. Para iniciar a implementação,
// além de ler os itens de um mapa e o filtro de um inteiro, você deverá ler uma
// `String` qualquer. Caso seu valor seja vazio, todas as receitas deverão ser 
// exibidas. Caso contrário, apenas as receitas cujos nomes contém seu valor 
// deverão ser exibidas. Caso nenhuma receita se encaixe nessa condição, exiba o
// texto "Nenhuma receita encontrada" centralizado na tela.
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
  final String busca = '';

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
                        if (busca.isEmpty || valor.contains(busca))
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
