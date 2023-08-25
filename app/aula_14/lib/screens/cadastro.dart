// Tela de cadastro
// O usuário não cadastrado ainda irá acessar a aplicação por meio desta tela
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _EstadoTelaCadastro();
}

class _EstadoTelaCadastro extends State<TelaCadastro> {
  String _email = ''; // Armazena o e-mail do usuário
  String _senha = ''; // Armazena a senha do usuário
  String? _erroEmail; // Armazena o erro do campo de e-mail do layout
  String? _erroSenha; // Armazena o erro do campo de senha do layout

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
            child:
                const Text('cadastrar', style: TextStyle(color: Colors.white)),
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
