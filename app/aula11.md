# Firebase

## Configuração local

### Linha de comando

Será necessário ter o `npm` instalado, [disponível aqui](https://nodejs.org/en/download).

O `npm` permitirá acesso ao executável do Firebase, que deve ser usado para carregar seus projetos da nuvem.

Antes, você precisará adicionar dois caminhos no PATH:

- o diretório de onde você instalou o `npm`
- o diretório exibido pelo comando `echo %LOCALAPPDATA%\Pub\Cache\bin` no Windows

```shell
npm --version
npm install -g firebase-tools
firebase --version
firebase login
```

Será necessário ter o Dart e o Flutter instalado, [disponível aqui](https://docs.flutter.dev/get-started/install)
(se você tem o Flutter instalado, já tem necessariamente o Dart instalado). 

O `dart` permitirá acesso
ao executável do FlutterFire, que deve ser usado para associar seu projeto Flutter ao seu projeto do 
Firebase.

```shell
dart --version
dart pub global activate flutterfire_cli
flutterfire --version
```


```shell
flutter --version
flutter create nome_projeto --empty --platforms web,android
cd nome_projeto
flutter pub add firebase_core firebase_auth firebase_database
flutter pub get
flutterfire configure --project curso-flutter-ufpa
```

### Código-fonte

O código gerado terá o conteúdo

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(/* ... */);
}
```

Será necessário adicionar as seguintes linhas:

```dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,    
  );

  runApp(/* ... */);
}
```
