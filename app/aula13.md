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

## Erros comuns

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

## Exercícios

1. A aplicação será de gerenciamento de projetos, cujos usuários serão desenvolvedores.
2. Crie uma tela de entrada, permitindo a inserção de e-mail e senha, além de um botão "Entrar".
3. Crie uma tela de cadastro, permitindo a inserção de e-mail e senha, além de um botão "Cadastrar".
4. A tela de entrada deverá redirecionar para a tela de cadastro, por meio de um botão "Criar conta".
5. Tanto a tela de entrada quanto a tela de cadastro, caso a autenticação seja válida, deverão levar o desenvolvedor para uma tela de projetos.
6. A tela de projetos deve verificar se o desenvolvedor logado já possui seus dados inseridos na plataforma, que devem ser
   - nome (campo livre, use `TextFormField`)
   - cargo (campo de escolha entre "Desenvolvedor", "Gerente" e "Testador", use `DropdownFormField`)
   - ativo (campo binário, use `CheckboxListTile`)
   - data de entrada no projeto (campo de data, use `TextFormField` ou [`showDatePicker`](https://stackoverflow.com/a/52729082/9997212))
7. Em caso negativo, o desenvolvedor poderá acessar uma tela de formulário por meio de um botão "Finalizar cadastro".
   Ao preencher o formulário e finalizar, os dados deverão ser persistidos no banco de dados em nuvem.
8. Em caso positivo, o desenvolvedor terá acesso a dois botões:
   - "Editar cadastro", cujo desenvolvedor poderá acessar a tela de formulário e editar seus dados em nuvem.
   - "Remover cadastro", o desenvolvedor poderá remover seus dados na nuvem, que deverá ativar o passo 7.
