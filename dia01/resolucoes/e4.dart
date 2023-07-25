void main() {
  // Como forma de verificar a saúde dos alunos a cada início de semestre, um 
  // nutricionista faz uma medição adicional no peso de cada aluno. 
 
  // Utilizando o programa criado na primeira questão
  final String nome = 'Enzo Gabriel da Rocha Santos';
  int idade = 21;
  const bool ehNovato = true;
  double peso = 62.5;
  final List<int> notas = [3, 4, 5, 6];
  const Set<String> disciplinas = {'português', 'matemática', 'história'};
  String? endereco = 'Belém, PA';

  // Após a declaração das variáveis, resolva as seguintes situações:
  
  // A balança do nutricionista dá resultados apenas como texto! Crie uma 
  // variável `pesoBalanca`, do tipo `String`, e atribua um valor numérico 
  // arbitrário. Crie outra variável `pesoAtual`, do tipo `double`, e transforme
  // o valor de `pesoBalanca` para um valor aceito por `pesoAtual`.
  final String pesoBalanca = '65.2';
  double pesoAtual = double.parse(pesoBalanca);

  // A balança possui um limite de 70kg, e partir disso ela retorna resultados 
  // negativos. Para padronizar todos os alunos, atualize `pesoAtual` para o seu
  // valor absoluto.
  pesoAtual = pesoAtual.abs();

  // Por fim, arredonde o peso para o valor inteiro mais próximo.
  pesoAtual = pesoAtual.round();

  // Exiba na tela o resultado das operações realizadas.
  print('Peso: $pesoAtual kg');
}
