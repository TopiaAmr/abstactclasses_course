import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

abstract class CanRun {
  void run();
}

class Dog extends CanRun {
  final String name;

  Dog(this.name);

  @override
  void run() {
    "$name can run".log();
  }
}

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Dog bella = Dog("Bella");
    bella.run();
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(bella.name),
        ),
      ),
    );
  }
}
