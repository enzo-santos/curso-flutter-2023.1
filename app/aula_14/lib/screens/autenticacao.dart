import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Tela de autenticação
// O usuário já cadastrado irá acessar a aplicação por meio desta tela
class TelaAutenticacao extends StatefulWidget {
  const TelaAutenticacao({super.key});

  @override
  State<TelaAutenticacao> createState() => _EstadoTelaAutenticacao();
}

class _EstadoTelaAutenticacao extends State<TelaAutenticacao> {
  String _email = ''; // Armazena o e-mail do usuário
  String _senha = ''; // Armazena a senha do usuário
  String? _erroEmail; // Armazena o erro do campo de e-mail do layout
  String? _erroSenha; // Armazena o erro do campo de senha do layout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(height: 10),
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
              const SizedBox(height: 15),
              // Botão em que o usuário clicará para entrar
              MaterialButton(
                padding: const EdgeInsets.all(15),
                color: Colors.blue,
                child:
                    const Text('entrar', style: TextStyle(color: Colors.white)),
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
        ),
      ),
    );
  }
}
