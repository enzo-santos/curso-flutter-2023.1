void main() {
  // Você está desenvolvendo um sistema de cadastro de alunos e precisa criar um 
  // programa em Dart para armazenar e exibir suas informações pessoais. Crie um 
  // programa que declare e atribua valores às seguintes variáveis:

  // `nome`: deve conter o nome completo do aluno
  final String nome = 'Enzo Gabriel da Rocha Santos';

  // `idade`: deve conter a idade do aluno, em anos
  int idade = 21;

  // `ehNovato`: deve indicar se o aluno entrou no ano atual na escola
  const bool ehNovato = true;

  // `peso`: deve conter o peso do aluno, em quilogramas
  double peso = 62.5;

  // `notas`: deve conter as notas do aluno em 4 avaliações, que podem ir de 0 a 10
  final List<int> notas = [3, 4, 5, 6];

  // `disciplinas`: deve conter as disciplinas que o aluno está cursando
  const Set<String> disciplinas = {'português', 'matemática', 'história'};

  // `endereco`: deve conter o endereço do aluno como texto. 
  // No entanto, um aluno pode não ter um endereço cadastrado no sistema ainda.
  String? endereco = 'Belém, PA';

  // Após a declaração e atribuição dos valores, exiba na tela as informações do 
  // aluno. Certifique-se de exibir o seu nome, a sua idade, se é novato, o seu 
  // peso, suas notas, as disciplinas que está cursando e seu endereço, caso possua.
  print('Nome: $nome');
  print('Idade: $idade anos');
  print('Novato: $ehNovato');
  print('Peso: $peso kg');
  print('Notas: $notas');
  print('Disciplinas: $disciplinas');
  print('Endereço: $endereco');
}
