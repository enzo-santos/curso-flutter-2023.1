// Para iniciar o desenvolvimento do aplicativo, você precisa criar a sua 
// estrutura básica. Exiba uma versão mínima contendo a mensagem "Sem receitas 
// ainda." centralizado na tela.
//
// Futuramente, você deve adicionar botões de ações no canto superior direito da 
// tela, como ajuda e sair do aplicativo. Adicione também uma barra de tarefas 
// superior contendo, no momento, apenas o título "Minhas receitas". 
//
// Verifique se o layout é exibido corretamente na tela.
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
     appBar: AppBar(title: const Text('Minhas receitas')), 
     body: const Center(child: Text('Sem receitas ainda.')), 
    ),
  ));
}