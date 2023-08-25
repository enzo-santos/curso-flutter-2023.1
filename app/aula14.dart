import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(home: TelaConsulta()));
}

// Modelo de um usuário do nosso banco
class Usuario {
  // ID
  // É sempre único para cada um dos modelos da tabela de `usuarios` 
  final String id;

  // Campos 
  final String nome;
  final String cargo;
  final DateTime dataEntrada;
  final bool ativo;

  // Para deserialização
  Usuario.fromJson(String id, Map dados)
      : this(
          id: id,
          nome: dados['nome'],
          cargo: dados['cargo'],
          ativo: dados['ativo'],
          // Para ler datas do banco, sempre usar `DateTime.parse`
          dataEntrada: DateTime.parse(dados['data-entrada']),
        );

  // Para construção no próprio código
  const Usuario({
    required this.id,
    required this.nome,
    required this.cargo,
    required this.dataEntrada,
    required this.ativo,
  });

  // Para serialização
  Map<String, Object?> toJson() {
    return {
      'nome': nome,
      'cargo': cargo,
      'ativo': ativo,
      // Para escrever datas no banco, sempre usar `dateTime.toIso8601String()`
      'data-entrada': dataEntrada.toIso8601String(),
    };
  }
}

// Modelo de um projeto do nosso banco
class Projeto {
  // ID
  // É sempre único para cada um dos modelos da tabela de `projetos` 
  final String id;

  // ID estrangeiro
  // Se refere a outros modelos do nosso banco, não é necessariamente único
  final String idGerente;

  // Campos
  final String nome;
  final int numeroMembros;
  final DateTime dataEntrega;
  final bool concluido;

  // Para deserialização
  Projeto.fromJson(String id, Map dados)
      : this(
          id: id,
          nome: dados['nome'],
          numeroMembros: dados['numero-membros'],
          dataEntrega: DateTime.parse(dados['data-entrega']),
          concluido: dados['concluido'],
          idGerente: dados['id-gerente'],
        );

  // Para construção no próprio código 
  const Projeto({
    required this.id,
    required this.idGerente,
    required this.nome,
    required this.numeroMembros,
    required this.dataEntrega,
    required this.concluido,
  });

  // Para serialização
  Map<String, Object?> toJson() {
    return {
      'nome': nome,
      'numero-membros': numeroMembros,
      'data-entrega': dataEntrega.toIso8601String(),
      'concluido': concluido,
      'id-gerente': idGerente,
    };
  }
}

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
            child: const Text('cadastrar', style: TextStyle(color: Colors.white)),
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


class CustomMaterialButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      padding: const EdgeInsets.all(10),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}

class TelaProjetos extends StatefulWidget {
  final String uid;

  const TelaProjetos({super.key, required this.uid});

  @override
  State<TelaProjetos> createState() => _EstadoTelaProjetos();
}

class _EstadoTelaProjetos extends State<TelaProjetos> {
  late Stream<Usuario?> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseDatabase.instance
        .ref()
        .child('membros')
        .child(widget.uid)
        .onValue
        .map((event) {
      var snapshot = event.snapshot;
      String id = snapshot.key!;
      Map? dados = snapshot.value as Map?;
      if (dados == null) return null;
      return Usuario.fromJson(id, dados);
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
        stream: _stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final Usuario? usuario = snapshot.data;
          if (usuario == null) {
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
                        id: widget.uid,
                        nome: 'Enzo',
                        cargo: 'Desenvolvedor',
                        dataEntrada: DateTime.now(),
                        ativo: true,
                      );
                      await FirebaseDatabase.instance
                          .ref()
                          .child('membros')
                          .child(widget.uid)
                          .set(usuario.toJson());
                    },
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(usuario.nome),
                Text(usuario.cargo),
                Text(usuario.dataEntrada.toString()),
                Text(usuario.ativo ? 'Ativo' : 'Inativo'),
                const SizedBox(height: 10),
                MaterialButton(
                  color: Colors.blue,
                  child: const Text('incluir em projeto'),
                  onPressed: () async {
                    var referencia = FirebaseDatabase.instance
                        .ref()
                        .child('projetos')
                        .push();

                    String idUnico = referencia.key!;
                    Projeto projeto = Projeto(
                      id: idUnico,
                      idGerente: usuario.id,
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
                  stream: FirebaseDatabase.instance
                      .ref()
                      .child('projetos')
                      .orderByChild('id-gerente')
                      .equalTo(usuario.id)
                      .onValue
                      .map((event) {
                    var snapshot = event.snapshot;
                    Map? dados = snapshot.value as Map?;
                    if (dados == null) return [];
                    return dados.entries.map((entry) {
                      String idProjeto = entry.key;
                      Map dadosProjeto = entry.value;
                      return Projeto.fromJson(idProjeto, dadosProjeto);
                    }).toList();
                  }),
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
        },
      ),
    );
  }
}
