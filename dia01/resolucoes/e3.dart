void main() {
  // As notas do semestre passado ainda não foram lançadas pois são muitos papéis, e 
  // fazer manualmente está demorando muito. Como você é o novo desenvolvedor, você
  // vai precisar manipular as notas de cada aluno. O sistema deve permitir adicionar,
  // remover e ordenar as notas dos alunos, além de extrair uma sublistagem específica.
 
  // Utilizando o programa criado na primeira questão
  final String nome = 'Enzo Gabriel da Rocha Santos';
  int idade = 21;
  const bool ehNovato = true;
  double peso = 62.5;
  final List<int> notas = [3, 4, 5, 6];
  const Set<String> disciplinas = {'português', 'matemática', 'história'};
  String? endereco = 'Belém, PA';

  // Após a declaração das variáveis, resolva as seguintes situações:
  
  // No fim do ano anterior, o professor resolveu dar um presente aos alunos e resolveu 
  // dar a nota máxima para todos como uma nota bônus. Adicione a nota 10 a `notas`.
  notas.add(10);

  // A prova da terceira avaliação teve muitas questões anuladas por um erro da 
  // escola e o diretor decidiu cancelar esta nota. Remova a terceira nota de `notas`.
  notas.removeAt(2);

  // O professor precisava saber as notas apenas do primeiro semestre de cada aluno para
  // usar como base posteriormente no Conselho de Classe. Crie uma nova lista chamada 
  // `notas1Semestre` contendo apenas as duas primeiras notas de `notas`.
  final List<int> notas1Semestre = notas.sublist(0, 2);

  // Alguns alunos, por um engano da secretária da escola, apareceram com uma nota
  // 11 no seu boletim. Remova esta nota de `notas`, caso esteja presente.
  notas.remove(11);

  // Por fim, ordene `notas` em ordem crescente.
  notas.sort();

  // Exiba na tela o resultado das operações realizadas.
  print('Notas: $notas');
}
