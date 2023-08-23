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
  .then((snapshot) => snapshot.value as Map);

print(dados);
```

irá retornar o modelo de ID `83b0KaUAdQPQ4QYtQaMoZ4dd8zO2` na tabela `usuarios` como um `Map`.

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
toda vez que houver uma atualização.
