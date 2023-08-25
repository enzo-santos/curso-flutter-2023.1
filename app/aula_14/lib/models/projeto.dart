// Modelo de um projeto do nosso banco
class Projeto {
  // ID: é sempre único para cada um dos modelos da tabela de `projetos`
  final String id;

  // ID estrangeiro: Se refere a outros modelos do banco, não é necessariamente único
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
