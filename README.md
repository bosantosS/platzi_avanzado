# platzi_avanzado

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Arquitectura de Software

**Arquitecture** estructurar, dise~ar y proyectar algo.

**De Software** ayuda a estructurar, dise~ar y proyectar un proyecto.

1. Indica la estructura, funcionamiento e interaccion entre las partes del software.

2. Orden en el proyecta, visible para todo el equipo.

**Arquitecturas usadas en Flutter y porque BLoC**

### 1. Vanilla

En esta arquitectura la lógica y la vista se colocan en el Widget. Su principal beneficio es que es simple y autónoma. Conectado en cualquier parte de tu aplicación, recuperará y renderizará datos.

Por otro lado, escribir widgets de esta manera puede generar caos en el documento de vista de la app, sobre todo cuando la lógica empieza a extenderse a bifurcarse o es más avanzado.

| Ventajas | Desventajas |
| ----------- | ----------- |
| Simple y autonoma. | Si la logica es extensa genera caos en el documento. |
| Facil de aprender. | Rompe con el Single Responsability Pronciple. |

### 2. Scoped Model

Este es una librería de terceros [Puedes encontrar toda la información aquí](https://pub.dev/packages/scoped_model) que no está incluída. Es extraída del código base del Sistema operativo Fuchsia.

| Ventajas | Desventajas |
| ----------- | ----------- |
| Separa la logica de negocio de la logica de UI y UX. | Reconstruye todo el arbol de widgets con cada cambio de estado en un Widget. |
| . | Mantenimiento complejo, demasiada dependencia entre Widgets.. |

### 3. BLoC (Business Logic Components)

Patron de dise~o que separa la logica de negocio y la interfaz grafica. 

* View , toda la interaccion con las pages y widgets.
* BLoC , logica de negocio. Casos de usos, acciones de usuario (login, logout, register, etc).
* Repository , clases que se conectan a una fuente de datos (BD local y red, socketio, mi servidor, firebase, etc.)
* Data , clases y modelos (POJO). Plain Old Dart Object (PODO.

## BLoC + [Clean Architecture](https://github.com/ShadyBoukhary/Axion-Technologies-HnH/wiki/The-Clean-Architecture-for-Flutter)
 View * --> 1 BLoC

[generic_bloc_provider](https://pub.dev/packages/generic_bloc_provider/install) ; Provider de manera global y generico, ocupa todo el arbol de Widgets.

## Firebase + Flutter

1. Crear un proyecto en firebase (necesita cta gmail).
2. Creas un proyecto android y ios.

> Para el proyecto android es necesario:

>> 1. Obtener el applicationId en android/app/build.gradle en la seccion defaultConfig{}

>> 2. Obtener el certificadefingerprints SHA1: Verificar que el jdkn.m/bin este en la variable de entorno PATH y ejecutar el comando:

'keytool -list -v -alias androiddebugkey -keystore C:\users\<user_name>\.android\debug.keystore'

>keyword: 'android'

3. Descargar el .json y colocarlo en android/app

4. Cambiar en android/app/build.gradle en 
 defaultConfig{
     minSdkVersion 21 # Por defecto es la 16 en Flutter
  }

5. Cambios a nivel android/buil.gradle en:
dependencies{
    ...
    // Add
    classpath 'com.google.gms:google-services:4.3.5'
}

6. Cambios en android/app/build.gradle al final del proyecto:
// Add this line
apply plugin: 'com.google.gms.google-services'
Guardar cambios y correr el comando ```flutter pub get``` o ```flutter packages get```

7. Cambios en android/gradle.properties
```
org.gradle.jvmargs=-Xmx1536M
android.useAndroidX=true
android.enableJetifier=true
```
Es posible que estas lineas se hayan agregado automaticamente despues de hacer ```flutter pub get```.

8. En android/app/build.gradle actualizar:
```
compileSdkVersion 28 #O mayor
targetSdkVersion 28 #O mayor

...

defaultConfig{
    ...
    multiDexEnabled true
}
```
9. Instalar las dependencias de Firebase a usar:
* [authentication](https://pub.dev/packages/firebase_auth/install)
* [google sig in](https://pub.dev/packages/google_sign_in/install)
* [firebase storage](https://pub.dev/packages/firebase_storage/install)
* [cloud firestore](https://pub.dev/packages/cloud_firestore/install)

10. Antes de usar cualquier producto de firebase, se debe inicializar la Firebase App:

En lib/main.dart :
```
// Import FirebaseApp
import 'package:firebase_core/firebase_core.dart';
...
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
```
En el pubspec.yaml:
```
dependencies:
  firebase_core: ^1.0.2 # Initialize Firebase App
``` 
Si quieres conocer otras formar de inicializar firebase app -> [Starting Since August 17 2020](https://stackoverflow.com/questions/63492211/no-firebase-app-default-has-been-created-call-firebase-initializeapp-in)

### Otra manera de instalar todo es seguir la [guia de instalacion de firebase](https://firebase.google.com/docs/flutter/setup?hl=es&platform=android)

## Links

* https://firebase.flutter.dev/docs/storage/usage/
* https://medium.com/comunidad-flutter/implementa-arquitectura-a-tu-proyecto-flutter-usando-el-patr%C3%B3n-bloc-2cb031722166
* https://github.com/ShadyBoukhary/Axion-Technologies-HnH/wiki/The-Clean-Architecture-for-Flutter
*  https://platzi.com/cursos/flutter-avanzado/
* https://itnext.io/firebase-storage-uploading-and-downloading-files-multi-file-picker-in-flutter-7360a90c68a7
