# Banco de dados no Firebase

O banco de dados no Firebase pode ser acessado adicionando as seguintes dependências no código:

```shell
flutter pub add firebase_database
flutter pub get
```

## Operações

### Escrita

A operação

```dart
await FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
  .set({'nome': 'Paula', 'ativo': false, 'data-nascimento': '19/02'});
```

irá, na tabela `usuarios`, para o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2`, escrever
os dados de nome, data de nascimento e se está ativo no sistema. Campos ausentes serão *removidos*.

### Atualização

A operação

```dart
await FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
  .update({'nome': 'Paula'});
```

irá, na tabela `usuarios`, para o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2`, atualizar
apenas os dados de nome. Campos ausentes serão *mantidos*.

### Remoção

A operação

```dart
await FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
  .remove();
```

irá, na tabela `usuarios`, remover o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2`.

### Criação

A operação

```dart
await FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .push()
  .set({'nome': 'Paula', 'ativo': false, 'data-nascimento': '19/02'});
```

irá, na tabela `usuarios`, criar um modelo com um ID único e definir seus dados de 
nome, data de nascimento e se está ativo no sistema.

### Leitura

A operação

```dart
var dados = await FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
  .get()
  .then((snapshot) => snapshot.value as Map?);

print(dados);
```

irá retornar o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2` na tabela `usuarios` como um `Map`.
Se não houver um modelo com esse ID na tabela, `dados` será nulo.

### Leitura contínua

A operação

```dart
FirebaseDatabase
  .instance
  .ref()
  .child('usuarios')
  .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
  .onValue
  .map((event) => event.snapshot.value as Map)
  .listen((dados) {
    print(dados);
  });
```

irá retornar o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2` na tabela `usuarios` como um `Map`
toda vez que houver uma atualização. Se não houver um modelo com esse ID na tabela, `dados` será nulo.

## Boas práticas

- Ao usar a leitura contínua em um `StreamBuilder`, use um campo dentro do `initState` para armazenar
  a `Stream<Map?>` retornada pelo `FirebaseDatabase` e use esse campo como parâmetro `stream` do `StreamBuilder`:

  ```dart
  class Tela extends StatefulWidget {
    const Tela({super.key});

    @override
    State<Tela> createState() => _EstadoTela();
  }

  class _EstadoTela extends State<Tela> {
    late Stream<Map?> _stream;

    @override
    void initState() {
      super.initState();
      _stream = FirebaseDatabase
        .instance
        .ref()
        .child('usuarios')
        .child('83b0KaUAdQPQ4QYtQaMoZ4dd8zO2')
        .onValue
        .map((event) => event.snapshot.value as Map?);
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: StreamBuilder<Map?>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final Map? dados = snapshot.data;
            if (dados == null) return const Text('Sem dados.');
            return Text("${dados['nome']} ${dados['ativo']} ${dados['data-nascimento']}");
          },
        ),
      );
    }
  }
  ```

