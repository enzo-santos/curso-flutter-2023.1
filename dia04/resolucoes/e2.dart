// A concessionária também trabalha com carros e motos, e, apesar desses veículos
// possuírem vários atributos, apenas dois atributos de cada serão importantes 
// para o sistema: a quilometragem por ano e o número de portas de um carro, e 
// para a moto, o número de cilindradas e se possui partida elétrica.
//
// Crie classes para representar esses veículos e uma forma de exibir suas 
// informações.

abstract class Veiculo {
  final String marca;
  final String modelo;
  final int anoFabricacao;

  const Veiculo({
    required this.marca,
    required this.modelo,
    required this.anoFabricacao,
  });

  void exibeInformacoes() {
    print('Marca: $marca');
    print('Modelo: $modelo');
    print('Foi fabricado em $anoFabricacao.');
  }
}

class Carro extends Veiculo {
  final int quilometragem;
  final int numPortas;

  const Carro({
    required super.marca,
    required super.modelo,
    required super.anoFabricacao,
    required this.quilometragem,
    required this.numPortas,
  });

  @override
  void exibeInformacoes() {
    super.exibeInformacoes();
    print('Possui $numPortas portas.');
    print('Possui $quilometragem km rodados.');
  }
}

class Moto extends Veiculo {
  final int cilindradas;
  final bool possuiPartidaEletrica;

  const Moto({
    required super.marca,
    required super.modelo,
    required super.anoFabricacao,
    required this.cilindradas,
    required this.possuiPartidaEletrica,
  });

  @override
  void exibeInformacoes() {
    super.exibeInformacoes();
    print('Possui $cilindradas cilindradas.');
    print("Possui partida elétrica: ${possuiPartidaEletrica ? 'Sim' : 'Não'}");
  }
}

void main() {
  // Crie um carro e uma moto a partir dessas classes, com dados fictícios, e 
  // exiba suas informações.
  final Carro carro = Carro(
    marca: 'Acme Motors',
    modelo: 'Comet XT',
    anoFabricacao: 2015,
    quilometragem: 85000,
    numPortas: 4,
  );
  carro.exibeInformacoes();

  final Moto moto = Moto(
    marca: 'Phoenix Motorcycles',
    modelo: 'Firestorm 500',
    anoFabricacao: 2022,
    cilindradas: 498,
    possuiPartidaEletrica: true,
  );
  moto.exibeInformacoes();
}
