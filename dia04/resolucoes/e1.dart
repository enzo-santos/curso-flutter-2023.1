// Você foi contratado como desenvolvedor em uma concessionária de veículos e
// sua tarefa é criar um sistema de registro de veículos. O sistema deve 
// permitir o cadastro de diferentes tipos de veículos, como carros e motos, e
// fornecer funcionalidades específicas para cada tipo de veículo.

// Crie uma classe para representar um veículo, que deve ter uma marca, um modelo, 
// e seu ano de fabricação.

class Veiculo {
  final String marca;
  final String modelo;
  final int anoFabricacao;

  const Veiculo({
    required this.marca,
    required this.modelo,
    required this.anoFabricacao,
  });

  // Crie uma forma de exibir as informações desse veículo.
  void exibeInformacoes() {
    print('Marca: ${marca}');
    print('Modelo: ${modelo}');
    print('Ano de fabricação: ${anoFabricacao}');
  }
}

void main() {
  // Crie um veículo a partir dessa classe, com dados fictícios.
  final Veiculo veiculo = Veiculo(
    marca: 'Stellar Auto',
    modelo: 'Vortex GT',
    anoFabricacao: 2018,
  );

  // Exiba suas informações.
  veiculo.exibeInformacoes();
}
