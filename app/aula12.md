# Autenticação no Firebase

A autenticação no Firebase pode ser acessada adicionando as seguintes dependências no código:

```shell
flutter pub add firebase_auth
flutter pub get
```

## Operações

Existem quatro tipos de operações no Firebase: consulta, entrada, cadastro e saída.

A operação de cadastro também contém a operação de entrada: toda vez em que o usuário
se cadastra, ele automaticamente é logado na aplicação.

### Entrada de usuário

Situação em que o usuário já está cadastrado e deseja entrar com seu e-mail e senha.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaAutenticacao extends StatefulWidget {
  const TelaAutenticacao({super.key});

  @override
  State<TelaAutenticacao> createState() => _EstadoTelaAutenticacao();
}

class _EstadoTelaAutenticacao extends State<TelaAutenticacao> {
  String _email = '';  // Armazena o e-mail do usuário
  String _senha = '';  // Armazena a senha do usuário
  String? _erroEmail;  // Armazena o erro do campo de e-mail do layout
  String? _erroSenha;  // Armazena o erro do campo de senha do layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Campo em que o usuário inserirá o seu e-mail
          TextFormField(
            initialValue: _email,
            onChanged: (texto) => setState(() => _email = texto),
            decoration: InputDecoration(
              labelText: 'E-mail',
              errorText: _erroEmail,
              border: const OutlineInputBorder(),
            ),
          ),
          // Campo em que o usuário inserirá a sua senha
          TextFormField(
            initialValue: _senha,
            onChanged: (texto) => setState(() => _senha = texto),
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: _erroSenha,
              border: const OutlineInputBorder(),
            ),
          ),
          // Botão em que o usuário clicará para entrar
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: const Text('entrar', color: Colors.white),
            onPressed: () async {
              // Fazer validação do campo de e-mail e senha
              // Para o campo de e-mail, ver https://stackoverflow.com/a/50663835/9997212
              // Para o campo de senha, basta ver se tem o mínimo de 6 caracteres

              try {
                // Verifica as informações do usuário na nuvem
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: _email,
                  password: _senha,
                );

              } on FirebaseAuthException catch (e) {
                // Verifica os erros de validação ao verificar na nuvem
                String codigo = e.code;
                // Consultar os códigos em https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
                setState(() {
                  if (codigo == 'invalid-email') {
                    _erroEmail = 'E-mail inválido.';
                  } else if (codigo == 'user-disabled') {
                    _erroEmail = 'Usuário desabilitado.';
                  } else if (codigo == 'user-not-found') {
                    _erroEmail = 'Usuário não encontrado.';
                  } else if (codigo == 'wrong-password') {
                    _erroSenha = 'Senha inválida.';
                  } else {
                    _erroEmail = codigo;
                  }
                });
                return;
              }
              setState(() {
                _erroEmail = null;
                _erroSenha = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
```

### Cadastro de usuário

Situação em que o usuário ainda não está cadastrado e deseja criar seu e-mail e senha.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _EstadoTelaCadastro();
}

class _EstadoTelaCadastro extends State<TelaCadastro> {
  String _email = '';  // Armazena o e-mail do usuário
  String _senha = '';  // Armazena a senha do usuário
  String? _erroEmail;  // Armazena o erro do campo de e-mail do layout
  String? _erroSenha;  // Armazena o erro do campo de senha do layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Campo em que o usuário inserirá o seu e-mail
          TextFormField(
            initialValue: _email,
            onChanged: (texto) => setState(() => _email = texto),
            decoration: InputDecoration(
              labelText: 'E-mail',
              errorText: _erroEmail,
              border: const OutlineInputBorder(),
            ),
          ),
          // Campo em que o usuário inserirá a sua senha
          TextFormField(
            initialValue: _senha,
            onChanged: (texto) => setState(() => _senha = texto),
            decoration: InputDecoration(
              labelText: 'Senha',
              errorText: _erroSenha,
              border: const OutlineInputBorder(),
            ),
          ),
          // Botão em que o usuário clicará para se cadastrar
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.blue,
            child: const Text('cadastrar', color: Colors.white),
            onPressed: () async {
              // Fazer validação do campo de e-mail e senha
              // Para o campo de e-mail, ver https://stackoverflow.com/a/50663835/9997212
              // Para o campo de senha, basta ver se tem o mínimo de 6 caracteres

              try {
                // Tenta criar as informações do usuário na nuvem
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _email,
                  password: _senha,
                );

              } on FirebaseAuthException catch (e) {
                // Verifica os erros de validação ao verificar na nuvem
                String codigo = e.code;
                // Consultar os códigos em https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
                setState(() {
                  if (codigo == 'email-already-in-use') {
                    _erroEmail = 'E-mail já existente.';
                  } else if (codigo == 'invalid-email') {
                    _erroEmail = 'E-mail inválido.';
                  } else if (codigo == 'user-disabled') {
                    _erroEmail = 'Usuário desabilitado.';
                  } else if (codigo == 'weak-password') {
                    _erroSenha = 'Senha fraca.';
                  } else {
                    _erroEmail = codigo;
                  }
                });
                return;
              }
              setState(() {
                _erroEmail = null;
                _erroSenha = null;
              });
            },
          ),
        ],
      ),
    );
  }
}
```

### Consulta de usuário

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaConsulta extends StatelessWidget {
  const TelaConsulta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        // Escuta todos os eventos do aplicativo em forma de usuários
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Se o estado de autenticação ainda está sendo processado
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('Carregando...'));
          }

          // Aqui, o estado de autenticação já foi processado
          User? usuario = snapshot.data;

          // Se não há usuario ativo na sessão atual
          if (usuario == null) {
            return const TelaAutenticacao(); 
          }

          // Aqui, é possível acessar `usuario` para ver o usuário ativo na sessão atual 
          return const TelaProjetos();
        },
      ),
    );
  }
}

class TelaProjetos extends StatelessWidget {
  const TelaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Apenas usuários autenticados podem ver esta tela.'),
      ),
    );
  }
}
```

### Saída de usuário

Situação em que o usuário já entrou no aplicativo e deseja sair.

```dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TelaProjetos extends StatelessWidget {
  const TelaProjetos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Apenas usuários autenticados podem ver esta tela.'),
          MaterialButton(
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const Text('sair', color: Colors.white),
            onPressed: () async {
              // Faz com que o `snapshot` no código anterior vire nulo
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
```
