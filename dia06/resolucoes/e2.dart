// O conteúdo desta tela deve conter textos representando diferentes categorias 
// de receitas, como "Sobremesas", "Pratos principais" e "Aperitivos". Adicione 
// estes itens verticalmente ao longo da tela. Estes textos deverão ser 
// formatados como títulos, portanto formate-os com negrito e com fonte 24. Por
// fim, centralize cada texto na tela.
//
// Embaixo de cada título, deverão conter três textos com o nome das receitas. 
// Estes textos deverão ser formatados como subtítulo, portanto formate-os com 
// fonte 18. Os textos não deverão ficar centralizados na tela.
//
// O conteúdo da página deverá ficar parecido com a seguinte lista:
//
// - **Sobremesas**
//   - Torta de Maçã
//   - Mousse de Chocolate
//   - Pudim de Leite Condensado
// - **Pratos principais**
//   - Frango Assado com Batatas
//   - Espaguete à Bolonhesa
//   - Risoto de Cogumelos
// - **Aperitivos**
//   - Bolinhos de Queijo
//   - Bruschetta de Tomate e Manjericão
//   - Canapés de Salmão com Cream Cheese
// 
// Verifique se o layout é exibido corretamente na tela.
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Minhas receitas')),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Sobremesas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Text(
            'Torta de Maçã',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Mousse de Chocolate',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Pudim de Leite Condensado',
            style: TextStyle(fontSize: 18),
          ),
          Center(
            child: Text(
              'Pratos principais',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Text(
            'Frango Assado com Batatas',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Espaguete à Bolonhesa',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Risoto de Cogumelos',
            style: TextStyle(fontSize: 18),
          ),
          Center(
            child: Text(
              'Aperitivos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Text(
            'Bolinhos de Queijo',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Bruschetta de Tomate e Manjericão',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Canapés de Salmão com Cream Cheese',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
  ));
}
