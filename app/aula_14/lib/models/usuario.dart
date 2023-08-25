// Modelo de um usuário do nosso banco
class Usuario {
  // ID: é sempre único para cada um dos modelos da tabela de `usuarios`
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
