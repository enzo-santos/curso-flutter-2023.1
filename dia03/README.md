# Dia 3

Conteúdo: estruturas de repetição e programação funcional

## Snippets

- Parâmetros obrigatórios (`POb`) e parâmetros opcionais (`POp`)

```dart
// - POb posicionais
//     OK: calculaMedia1([1, 2, 3]);
//     ERRO: calculaMedia1();
//     ERRO: calculaMedia1(valores: [1, 2, 3]);
double calculaMedia1(List<int> valores) {
  int soma = 0;
  for (int valor in valores) soma += valor;
  return soma / valores.length;
}

// - POp posicionais
//     OK: calculaMedia2([1, 2, 3]);
//     OK: calculaMedia2();
//     ERRO: calculaMedia2(valores: [1, 2, 3]);
double calculaMedia2([List<int> valores = const []]) {
  int soma = 0;
  for (int valor in valores) soma += valor;
  return soma / valores.length;
}

// - POb nomeados
//     ERRO: calculaMedia3([1, 2, 3]);
//     ERRO: calculaMedia3();
//     OK: calculaMedia3(valores: [1, 2, 3]);
double calculaMedia3({required List<int> valores}) {
  int soma = 0;
  for (int valor in valores) soma += valor;
  return soma / valores.length;
}

// - POp nomeados
//     ERRO: calculaMedia4([1, 2, 3]);
//     OK: calculaMedia4();
//     OK: calculaMedia4(valores: [1, 2, 3]);
double calculaMedia4({List<int> valores = const []}) {
  int soma = 0;
  for (int valor in valores) soma += valor;
  return soma / valores.length;
}
```
