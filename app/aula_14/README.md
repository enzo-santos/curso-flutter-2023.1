# Banco de dados no Firebase

## Conteúdo

### Serialização

Para adicionar serialização nos modelos, adicione os seguintes campos:

1. Um campo chamado `id` do tipo `String`, para identificar o modelo no banco:

    ```dart
    class Modelo {
      final String id;
      // ...
   
      const Modelo({
        required this.id,
        // ...
      });
    }
    ```

2. Um construtor chamado `fromJson`, para ler os dados do banco:

    ```dart
    class Modelo {
      final String id;
      // ...
   
      Modelo.fromJson(String id, Map json)
        : this(
            id: id,
            // ...
          );
   
      const Modelo({
        required this.id,
        // ...
      });
    }
    ```

3. Um método chamado `toJson` que retorna `Map<String, Object?>`, para escrever os dados no banco:

    ```dart
    class Modelo {
      final String id;
      // ...
   
      Modelo.fromJson(String id, Map json)
        : this(
            id: id,
            // ...
          );
   
      const Modelo({
        required this.id,
        // ...
      });
   
      Map<String, Object?> toJson() {
        // Não é necessário colocar o `id` aqui
        return {
          // ...
        };
      }
    }
    ```

Para ler do banco, use `fromJson`:

```dart
FirebaseDatabase
   .instance
   .ref()
   .child('tabela')
   .child(id)
   .onValue
   .map((event) {
     DataSnapshot snapshot = event.snapshot;
     String id = snapshot.key!;
     Map? dados = snapshot.value as Map?;
     if (dados == null) {
       return null;
     } else {
       return Modelo.fromJson(id, dados);
     }
   })
   .listen((dados) => print(dados));
```

Para escrever no banco, use `toJson`:

```dart
await FirebaseDatabase
   .instance
   .ref()
   .child('tabela')
   .child(id)
   .set(modelo.toJson());
```

### Leitura em massa

Para ler todos os modelos de uma tabela do banco, use `get()` on `onValue` direto de 
`child('tabela')`:

```dart
FirebaseDatabase.instance
   .ref()
   .child('tabela')
   .onValue
   .map((event) {
     DataSnapshot snapshot = event.snapshot;
     Map? dados = snapshot.value as Map?;

     if (dados == null) {
       return [];
     } else {
       return dados.entries.map((entry) {
         String idModelo = entry.key;
         Map dadosModelo = entry.value;
         return Modelo.fromJson(idModelo, dadosModelo);
       }).toList();
     }
   })
   .listen((dados) => print(dados));
```

Para filtrar os modelos por um campo específico, use `orderByChild` e `equalTo` entre 
`child('tabela')` e `onValue`, como no arquivo *lib/screens/projetos.dart*.


## Exercícios

Utilizando o código da aula anterior,

1. Introduzindo projetos: devem ter um nome, uma data de entrega, se estão entregues e o número de 
   membros na equipe. Um usuário deve poder gerenciar zero ou mais projetos.
2. Quando o usuário estiver autenticado na aplicação, ele poderá visualizar, adicionar, remover ou 
   editar os dados de projetos em que ele próprio é o gerente. 
3. Nessa lista de visualização, o usuário deverá visualizar
   - a quantidade de projetos que ele gerencia 
   - a porcentagem de projetos entregues
   - o nome de projetos atrasados em vermelho (não entregues e que a data de entrega é anterior à 
     atual)
4. Opcionalmente, qualquer usuário pode atribuir um projeto a outro usuário, no seguinte fluxo:
   - um usuário **A** seleciona um projeto **P** em que **A** é gerente
   - é exibido a **A** um botão "Atribuir projeto", por exemplo
   - **A** clica no botão e uma lista de todos os usuários do sistema é exibida
   - **A** seleciona **B** na lista exibida
   - **P** agora deverá ser gerenciado por **B** ao invés de **A**
