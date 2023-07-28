// O dono da concessionária fez um amplo estudo do mercado e definiu métricas 
// para calcular o preço adicional de cada veículo. 

// De acordo com estimativas gerais, um carro usado por um motorista típico pode 
// percorrer em torno de 15.000 a 20.000 quilômetros por ano. Essa estimativa 
// leva em consideração uma combinação de deslocamentos diários para o trabalho,
// viagens de lazer e outras atividades. Portanto, o preço de um carro dessa 
// concessionária define que cada porta vale R$ 1000 e cada quilômetro rodado 
// vale R$ 0,01.

// Podemos considerar que a maioria das motos comuns, destinadas ao uso diário e 
// lazer, geralmente possui uma cilindrada entre 125cc e 500cc. Essas motos de 
// média cilindrada são populares para deslocamentos urbanos e viagens curtas. 
// Portanto, o preço de uma moto dessa concessionária define que cada cilindrada
// vale R$ 0,05 e o recurso de partida elétrica a valoriza em R$ 500.

// Note que esses preços são adições ao preço base do veículo, que chamaremos de 
// `precoBase`.

// Para cada tipo de veículo declarado anteriormente, defina uma forma de 
// calcular esse preço adicional a partir dos atributos de cada um. Cada tipo de
// veículo deve ter uma forma de receber um `precoBase`, calcular seu preço 
// adicional e retornar um novo preço.

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

  double calculaPreco(double precoBase);
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

  @override
  double calculaPreco(double precoBase) {
    return precoBase + numPortas * 1000 + quilometragem * 0.01;
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

  @override
  double calculaPreco(double precoBase) {
    double precoFinal = precoBase;
    precoFinal += cilindradas * 0.05;
    if (possuiPartidaEletrica) {
      precoFinal += 500;
    }
    return precoFinal;
  }
}

// A partir dos veículos criados na questão anterior, defina um preço base para 
// cada um deles e exiba seus novos preços com base neste cálculo.
void main() {
  final Carro carro = Carro(
    marca: 'Acme Motors',
    modelo: 'Comet XT',
    anoFabricacao: 2015,
    quilometragem: 85000,
    numPortas: 4,
  );
  print(carro.calculaPreco(40000));

  final Moto moto = Moto(
    marca: 'Phoenix Motorcycles',
    modelo: 'Firestorm 500',
    anoFabricacao: 2022,
    cilindradas: 498,
    possuiPartidaEletrica: true,
  );
  print(moto.calculaPreco(20000));
}
