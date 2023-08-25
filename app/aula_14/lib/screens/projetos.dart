import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../models/projeto.dart';
import '../models/usuario.dart';

// Tela de projetos
// Apenas o usuário autenticado irá acessar essa tela,
// que também conterá todos os seus projetos
class TelaProjetos extends StatefulWidget {
  final String uid;

  const TelaProjetos({super.key, required this.uid});

  @override
  State<TelaProjetos> createState() => _EstadoTelaProjetos();
}

class _EstadoTelaProjetos extends State<TelaProjetos> {
  // Contém a Stream para carregamos os dados do usuário atual no banco. Caso
  // essa Stream emita nulo, significa que ainda não há dados para o usuário.
  late Stream<Usuario?> _streamUsuario;

  @override
  void initState() {
    super.initState();

    // Carrega os dados do usuário atual (`widget.uid`) na tabela `membros`
    _streamUsuario = FirebaseDatabase.instance
        .ref()
        .child('membros') // na tabela `membros`
        .child(widget.uid) // retorne os dados do usuário atual (`widget.uid`)
        .onValue
        .map((event) {
      DataSnapshot snapshot = event.snapshot;

      // `id` contém o ID do modelo retornado (neste caso, o mesmo que `widget.uid`)
      String id = snapshot.key!;
      // `dados` contém os dados do modelo retornado
      Map? dados = snapshot.value as Map?;

      if (dados == null) {
        // se não houver nenhum modelo, retorne nulo
        return null;
      } else {
        // caso contrário, crie um [Usuario] utilizando o ID e os dados do modelo
        return Usuario.fromJson(id, dados);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StreamBuilder<Usuario?>(
        stream: _streamUsuario,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final Usuario? usuario = snapshot.data;
          if (usuario == null) {
            return _CorpoSemCadastro(uid: widget.uid);
          }
          return _CorpoComCadastro(usuario: usuario);
        },
      ),
    );
  }
}

// Componente para ser exibido caso o usuário não possua dados no banco
class _CorpoSemCadastro extends StatelessWidget {
  final String uid;

  const _CorpoSemCadastro({required this.uid});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Parece que você ainda não está cadastrado.'),
          const SizedBox(height: 10),
          MaterialButton(
            padding: const EdgeInsets.all(15),
            color: Colors.blueGrey,
            child: const Text(
              'finalizar cadastro',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Usuario usuario = Usuario(
                id: uid,
                nome: 'Enzo',
                cargo: 'Desenvolvedor',
                dataEntrada: DateTime.now(),
                ativo: true,
              );
              await FirebaseDatabase.instance
                  .ref()
                  .child('membros')
                  .child(uid)
                  .set(usuario.toJson());
            },
          ),
        ],
      ),
    );
  }
}

// Componente para ser exibido caso o usuário possua dados no banco
class _CorpoComCadastro extends StatefulWidget {
  final Usuario usuario;

  const _CorpoComCadastro({required this.usuario});

  @override
  State<_CorpoComCadastro> createState() => _EstadoCorpoComCadastro();
}

class _EstadoCorpoComCadastro extends State<_CorpoComCadastro> {
  // Contém a Stream para carregarmos a lista de projetos do usuário atual no
  // banco. Caso essa Stream emita uma lista vazia, significa que ainda não há
  // projetos para o usuário.
  late Stream<List<Projeto>> _streamProjetos;

  @override
  void initState() {
    super.initState();
    // Carrega a lista de projetos do usuário atual (`widget.uid`) na tabela `projetos`
    _streamProjetos = FirebaseDatabase.instance
        .ref()
        // na tabela `projetos`
        .child('projetos')
        // retorne os modelos em que `id-gerente`
        .orderByChild('id-gerente')
        // seja igual ao ID do usuário atual (`widget.usuario.id`)
        .equalTo(widget.usuario.id)
        .onValue
        .map((event) {
      DataSnapshot snapshot = event.snapshot;

      // `dados` contém todos os modelos que satisfazem a condição acima
      Map? dados = snapshot.value as Map?;

      if (dados == null) {
        // se não houver nenhum modelo, retorne uma lista vazia
        return [];
      } else {
        // caso contrário, para cada modelo que satisfaz a condição acima
        return dados.entries.map((entry) {
          // crie um [Projeto] utilizando o ID e os dados do modelo
          String idProjeto = entry.key;
          Map dadosProjeto = entry.value;
          return Projeto.fromJson(idProjeto, dadosProjeto);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.usuario.nome),
          Text(widget.usuario.cargo),
          Text(widget.usuario.dataEntrada.toString()),
          Text(widget.usuario.ativo ? 'Ativo' : 'Inativo'),
          const SizedBox(height: 10),
          MaterialButton(
            color: Colors.blue,
            child: const Text('incluir em projeto'),
            onPressed: () async {
              DatabaseReference referencia =
                  FirebaseDatabase.instance.ref().child('projetos').push();

              String idUnico = referencia.key!;
              Projeto projeto = Projeto(
                id: idUnico,
                idGerente: widget.usuario.id,
                nome: 'Projeto 1',
                numeroMembros: 4,
                dataEntrega: DateTime(2023, 9, 25),
                concluido: false,
              );
              await referencia.set(projeto.toJson());
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<List<Projeto>>(
            stream: _streamProjetos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              }
              List<Projeto> projetos = snapshot.data!;
              return Text('quantidade de projetos: ${projetos.length}');
            },
          ),
        ],
      ),
    );
  }
}
