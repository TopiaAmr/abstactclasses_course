import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  String get type {
    if (this is Dog) {
      return 'Cat';
    } else {
      return 'Something else';
    }
  }

  @mustCallSuper
  void run() {
    "CanRun's run function is called".log();
  }
}

class Dog extends CanRun {
  final String name;

  Dog(this.name);

  @override
  void run() {
    super.run();
    "$name can run".log();
  }
}

class Cat extends CanRun {
  final String name;

  Cat(this.name);

  @override
  void run() {
    super.run();
    "$name can run".log();
  }
}

void testIt() {
  final Dog bella = Dog("Bella");
  final Cat julia = Cat("julia");
  bella.run();
  bella.type.log();
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
