# Exercícios

Faça os seguintes itens serem selecionáveis no código abaixo:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatelessWidget {
  const Tela({super.key});
  
  @override
  Widget build(BuildContext context) {
    int? valor;
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Opção 1'),
            value: 1,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
          RadioListTile(
            title: const Text('Opção 2'),
            value: 2,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
          RadioListTile(
            title: const Text('Opção 3'),
            value: 3,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
        ],
      ),
    );
  }
}
```
