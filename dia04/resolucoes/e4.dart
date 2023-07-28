// Para colocar os veículos no pátio de vendas, cada veículo precisa ter um 
// adesivo que indica o estado desse veículo como uma forma de transparência 
// para o consumidor. Portanto, 
//
// - se um carro tiver menos que 15 mil km rodados por ano, ele é considerado 
//   seminovo; se tiver entre 15 mil e 20 mil km rodados por ano, ele é 
//   considerado usado; se tiver mais que 20 mil km rodados por ano, ele é 
//   considerado antigo.
// - se uma moto tiver menos que 125 cilindradas, ela é considerada leve; se 
//   tiver entre 125 e 500 cilindradas, ela é considerada normal; se tiver mais 
//   que 500 cilindradas, ela é considerada esportiva.
//
// Para cada tipo de veículo declarados na questão anterior, defina uma forma de 
// calcular o texto desse adesivo.

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

  String get textoAdesivo;
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

  @override
  String get textoAdesivo {
    if (quilometragem < 15000) return 'seminovo';
    if (quilometragem < 20000) return 'usado';
    return 'velho';
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

  @override
  String get textoAdesivo {
    if (cilindradas < 125) return 'leve';
    if (cilindradas < 500) return 'normal';
    return 'esportiva';
  }
}

// A partir dos veículos criados anteriormente, exiba os textos dos seus adesivos.
void main() {
  final Carro carro = Carro(
    marca: 'Acme Motors',
    modelo: 'Comet XT',
    anoFabricacao: 2015,
    quilometragem: 85000,
    numPortas: 4,
  );
  print(carro.textoAdesivo);

  final Moto moto = Moto(
    marca: 'Phoenix Motorcycles',
    modelo: 'Firestorm 500',
    anoFabricacao: 2022,
    cilindradas: 498,
    possuiPartidaEletrica: true,
  );
  print(moto.textoAdesivo);
}
