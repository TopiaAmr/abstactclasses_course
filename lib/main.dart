import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

enum Type { cat, dog }

abstract class CanRun {
  final Type type;

  const CanRun({required this.type});

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Dog extends CanRun {
  final String name;

  const Dog(this.name) : super(type: Type.dog);

  @override
  void run() {
    super.run();
    "$name can run".log();
  }
}

class Cat extends CanRun {
  final String name;

  const Cat(this.name) : super(type: Type.cat);

  @override
  void run() {
    super.run();
    "$name can run".log();
  }
}

void testIt() {
  const Dog bella = Dog("Bella");
  bella.run();
  bella.type.log();

  const Cat julia = Cat("julia");
  julia.run();
  julia.type.log();
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    testIt();
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}
