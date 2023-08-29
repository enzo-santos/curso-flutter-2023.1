import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class Usuario {
  String nome;
  bool ativo;

  Usuario({required this.nome, required this.ativo});
}

class _Form extends FormBloc<Usuario, void> {
  final TextFieldBloc nome = TextFieldBloc(
    initialValue: '',
    validators: [
      (text) => text.isEmpty ? 'Insira este campo.' : null,
      (text) => text.length > 50 ? 'Seu nome não pode ser muito longo.' : null,
    ],
  );
  final BooleanFieldBloc ativo = BooleanFieldBloc(
    initialValue: false,
  );

  // SelectFieldBloc<String, void> cargo
  // MultiSelectFieldBloc<String, void> projetos
  // InputFieldBloc<DateTime, void> dataEntrega
  // InputFieldBloc<int, void> numeroMembros

  _Form() {
    addFieldBlocs(fieldBlocs: [nome, ativo]);
  }

  @override
  void onSubmitting() async {
    Usuario usuario = Usuario(
      nome: nome.value,
      ativo: ativo.value,
    );
    emitSuccess(successResponse: usuario);
  }
}

class TelaFormulario extends StatelessWidget {
  const TelaFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _Form(),
      child: Builder(
        builder: (context) {
          _Form form = context.read<_Form>();
          return Scaffold(
            body: FormBlocListener<_Form, Usuario, void>(
              onSuccess: (context, estado) {
                Usuario usuario = estado.successResponse!;
                Navigator.pop(context, usuario);
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  TextFieldBlocBuilder(
                    textFieldBloc: form.nome,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  CheckboxFieldBlocBuilder(
                    booleanFieldBloc: form.ativo,
                    body: const Text('Ativo?'),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    child: const Text('finalizar'),
                    onPressed: () => form.submit(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
