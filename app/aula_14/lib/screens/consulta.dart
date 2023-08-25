import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'autenticacao.dart';
import 'projetos.dart';

// Tela de consulta de usuário
// A aplicação começará aqui, que verificará o estado atual do usuário da sessão
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
          return TelaProjetos(uid: usuario.uid);
        },
      ),
    );
  }
}
