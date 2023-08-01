Stream<int> countDownStream(int maxCount) async* {
  for (int i = maxCount; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  final Stream<int> countdown = countDownStream(5);

  countdown.listen((count) {
    print(count);
  }).onDone(() {
    print('Contagem regressiva concluída!');
  });
}
