# Curso Flutter de Férias 2023.1

[![Static Badge](https://img.shields.io/badge/sheets-repositórios-green?logo=googlesheets)](https://docs.google.com/spreadsheets/d/1LAPNtiIgmNhob_3M7Y3KR9olXNErpOao5mIVpSd6FvQ/edit?usp=sharing)
[![Static Badge](https://img.shields.io/badge/dart-dartpad-blue?logo=dart)](https://dartpad.dev)

## Resoluções

Dentro de cada diretório, há uma pasta chamada *resolucoes* contendo as resoluções de cada exercício. 

## Snippets

Alguns trechos de código úteis:

- Ler um valor do usuário e transformar em um tipo primitivo (nota: não funciona no Dartpad)

```dart
import 'dart:io';

void main() {
  String entrada = stdin.readLineSync()!;
  
  String entradaString = entrada;
  int entradaInt = int.parse(entrada);
  double entradaDouble = double.parse(entrada);
  bool entradaBool = entrada == 'sim' ? true : false;
}
```

- Gerar um número aleatório de `a` (inclusivo) a `b` (exclusivo)

```dart
import 'dart:math';

void main() {
  int a = 0;
  int b = 10;
  int numero = Random().nextInt(b) + a;
}
```

## Cronograma

> **Nota:** Não haverá aula nos dias 7 a 11 de agosto.

### Curso básico

Envolve a linguagem de programação Dart e sua *framework* Flutter.

| Dia                          | Conteúdo                                                                                                                                                                                                                                           |
|:----------------------------:|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|       Dia 1<br>(24/07)       | Visão geral sobre a programação multiplataforma<br>Histórico da linguagem da programação Dart<br>Modificadores (final, var, const)<br>Tipos primitivos (int, double, bool, String, List, Map, Set)<br>Nulabilidade (tipos nuláveis, operadores ??) |
|       Dia 2<br>(25/07)       | Operadores aritméticos (soma, subtração, multiplicação, divisão)<br>Operadores de comparação (igual, diferente, maior e menor que)<br>Operadores lógicos (e, não, ou, xou)<br>Estruturas de condição (if, switch-case)                             |
|       Dia 3<br>(26/07)       | Estruturas de repetição (for, while, do-while)<br>Programação funcional (funções, lambdas)                                                                                                                                                         |
|       Dia 4<br>(27/07)       | Programação orientada a objetos (classes, métodos e interfaces)                                                                                                                                                                                    |
|       Dia 5<br>(28/07)       | Programação assíncrona (Future, Stream, async, await)                                                                                                                                                                                              |
|       Dia 6<br>(31/07)       | Introdução ao ambiente de configuração<br>Fluxo de execução (função main, runApp, MaterialApp, hot reload/restart)<br>Text, Row, Column e ListView.                                                                                                |
|       Dia 7<br>(01/08)       | Container, SizedBox, Icon, MaterialButton, TextButton, IconButton, Expanded e Flexible.                                                                                                                                                            |
|       Dia 8<br>(02/08)       | Navegação entre telas (Navigator, pop, push, showDialog, AlertDialog)<br>Componentes de entrada (TextField, Radio, Checkbox, Switch, DropdownField)                                                                                                |
|       Dia 9<br>(03/08)       | Estados básicos (Stateless e Stateful)<br>Produtores de estado (ChangeNotifier, ValueNotifier)                                                                                                                                                     |
|       Dia 10<br>(04/08)      | Expositores de estado (Provider, ChangeNotifierProvider)<br>Consumidores de estado (Consumer)                                                                                                                                                      |
|       Dias 11-15<br>(07/08 - 11/08)      | Avaliação                                                                                                                               
