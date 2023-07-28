import 'dart:async';

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 5));
  return "Dados obtidos";
}

void main() async {
  await fetchData().then((data) => print(data));
}
