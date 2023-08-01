Future<int> future1() async {
  await Future.delayed(const Duration(seconds: 2));
  return 10;
}

Future<int> future2() async {
  await Future.delayed(const Duration(seconds: 1));
  return 20;
}

Future<int> future3() async {
  // Alternativa - usando delayed
  return await Future.delayed(const Duration(seconds: 3), () => 30);
}

Future<void> main() async {
  Future.wait([future1(), future2(), future3()]).then((List<int> received) {
    print('Valor do Future 1: ${received[0]}');
    print('Valor do Future 2: ${received[1]}');
    print('Valor do Future 3: ${received[2]}');
  });
}
