## Exemplos

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Cabecalho(),
          Corpo(texto: 'ABC'),
          Contador(valor: 3),
        ],
      ),
    );
  }
}

// Componente sem estado, sem parâmetros
class Cabecalho extends StatelessWidget {
  const Cabecalho({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Cabeçalho');
  }
}

// Componente sem estado, com parâmetros
class Corpo extends StatelessWidget {
  final String texto;

  const Corpo({super.key, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Text('Corpo: $texto');
  }
}

// Componente com estado
class Contador extends StatefulWidget {
  final int valor;

  const Contador({super.key, required this.valor});

  @override
  State<Contador> createState() => _EstadoContador();
}
   
class _EstadoContador extends State<Contador> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.valor;
  }
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$count'),
        TextButton(
          child: Text('adicionar'),
          onPressed: () {
            setState(() {
              count += 1;
            });
          },
        ),
      ],
    );
  }
}
```

### Conversão para Stateful

Seja

```dart
import 'package:flutter/material.dart';

class Componente extends StatelessWidget {
  const Componente({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Olá, mundo!');
  }
}
```

1. Altere `StatelessWidget` para `StatefulWidget`:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     const Componente({super.key});
  
     @override
     Widget build(BuildContext context) {
       return Text('Olá, mundo!');
     }
   }
   ```

2. Sobrescreva o método `createState` retornando uma nova classe. Esta classe
   deve ter o mesmo nome da classe-componente, mas prefixado por `_Estado`:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     const Componente({super.key});

     @override
     State<Componente> createState() => _EstadoComponente();

     @override
     Widget build(BuildContext context) {
       return Text('Olá, mundo!');
     }
   }
   ```

3. Crie a nova classe referenciada no código anterior, herdando de `State`:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     const Componente({super.key});

     @override
     State<Componente> createState() => _EstadoComponente();

     @override
     Widget build(BuildContext context) {
       return Text('Olá, mundo!');
     }
   }
   
   class _EstadoComponente extends State<Componente> {}
   ```

4. Mova o conteúdo do método `build` para a nova classe-estado criada:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     const Componente({super.key});

     @override
     State<Componente> createState() => _EstadoComponente();
   }
   
   class _EstadoComponente extends State<Componente> {
     @override
     Widget build(BuildContext context) {
       return Text('Olá, mundo!');
     }
   }
   ```

5. Se a classe-componente aceitar parâmetros, acesse-os na classe-estado utilizando `widget.`:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     final String valor;

     const Componente({super.key, required this.valor});

     @override
     State<Componente> createState() => _EstadoComponente();
   }
   
   class _EstadoComponente extends State<Componente> {
     @override
     Widget build(BuildContext context) {
       return Text('Olá, ${widget.valor}!');
     }
   }
   ```

6. Se a classe-estado precisar modificar os argumentos recebidos na classe-componente,
   sobrescreva a função `initState`:

   ```dart
   import 'package:flutter/material.dart';

   class Componente extends StatefulWidget {
     final int valor;

     const Componente({super.key, required this.valor});

     @override
     State<Componente> createState() => _EstadoComponente();
   }
   
   class _EstadoComponente extends State<Componente> {
     late int count;

     @override
     void initState() {
       super.initState();
       count = widget.valor;
     }
   
     @override
     Widget build(BuildContext context) {
       return TextButton(
         child: Text('$count'),
         onPressed: () {
           setState(() {
             count += 1;
           });
         },
       );
     }
   }
   ```

## Exercícios

1) Faça os seguintes itens serem selecionáveis no código abaixo:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tela(),
  ));
}

class Tela extends StatelessWidget {
  const Tela({super.key});
  
  @override
  Widget build(BuildContext context) {
    int? valor;
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            title: const Text('Opção 1'),
            value: 1,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
          RadioListTile(
            title: const Text('Opção 2'),
            value: 2,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
          RadioListTile(
            title: const Text('Opção 3'),
            value: 3,
            groupValue: valor,
            onChanged: (novoValor) {},
          ),
        ],
      ),
    );
  }
}
```
