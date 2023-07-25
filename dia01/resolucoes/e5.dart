void main() {
  // O programador novo do seu setor achou melhor usar um mapa (`Map`) para 
  // organizar alunos e seus pesos, refatorando todo o trabalho que você teve 
  // durante todo esse tempo. Cada chave do mapa é o nome de um aluno (`String`)
  // e cada valor é seu peso (`double`).
 
  // Utilizando o programa criado na primeira questão
  final String nome = 'Enzo Gabriel da Rocha Santos';
  int idade = 21;
  const bool ehNovato = true;
  double peso = 62.5;
  final List<int> notas = [3, 4, 5, 6];
  const Set<String> disciplinas = {'português', 'matemática', 'história'};
  String? endereco = 'Belém, PA';

  // Após a declaração das variáveis, crie um mapa chamado `pesos` e
  final Map<String, double> pesos = {};

  // Resolva as seguintes situações:
  
  // Adicione uma aluna inicial a `pesos`. Seu nome é Carol e ela pesa 58.2 kg.
  pesos['Carol'] = 58.2;

  // Adicione o aluno atual a `pesos`. Seu nome está armazenado em `nome` e seu 
  // peso em `peso`.
  pesos[nome] = peso;

  // Adicione mais alguns alunos! Defina seu nome e o associe a um peso.
  pesos['João'] = 75.3;
  pesos['Paula'] = 67.9;

  // Armazene o valor correspondente à chave de um aluno que você adicionou em 
  // uma variável chamada `pesoNovo`.
  final double? pesoNovo = pesos['João'];

  // Perdão, a Carol não deveria ser adicionada ainda. Remova a entrada 
  // correspondente ao seu nome.
  pesos.remove('Carol');

  // Exiba se o mapa contém uma chave igual ao seu primeiro nome.
  print("Estou no mapa: ${pesos.containsKey('Enzo')}");

  // Exiba na tela o resultado das operações realizadas.
  print('Pesos: $pesos');
}
