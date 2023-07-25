void main() {
  // Como o sistema está sendo implementado depois das férias escolares, é de praxe
  // que os professores peçam para os alunos escreverem redações sobre o que fizeram
  // no período. 

  // Para digitalizar o que um aluno escreveu, declare uma variável `redacao` do
  // tipo texto com alguma frase curta, representando a redação de um aluno.
  const String redacao = 'O rato roeu a roupa do rei de Roma';
  
  // Após a declaração da variável, resolva as seguintes situações:

  // A redação deve obrigatoriamente falar sobre as férias. Exiba se `redacao` 
  // possui em alguma parte o texto "férias".
  final bool falaDasFerias = redacao.contains('férias');
  print("Fala das férias: $falaDasFerias");

  // A redação deve ter uma quantidade mínima de palavras. Exiba quantas palavras
  // `redacao` possui. Considere o caractere espaço como delimitador de uma palavra.
  final int quantidadePalavras = nome.split(' ').length;
  print("Palavras: $quantidadePalavras");

  // Lendo a redação de alguns alunos, você percebeu que muitos deles estavam 
  // escrevendo "mais melhor"! Como está sendo começo de semestre, você deixa passar
  // só dessa vez. Exiba `redacao` com essa correção, substituindo as ocorrências
  // de "mais melhor" por "melhor".
  final String redacaoCorrigida = redacao.replaceAll('mais melhor', 'melhor');
  print("Redação corrigida: '$redacaoCorrigida'");
}
