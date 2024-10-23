import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;

  void inc1() {
    one += 1;
    notifyListeners();
  }

  void inc2() {
    two += 1;
    notifyListeners();
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => Model(),
        child: const _View(),
      );
}

class _View extends StatelessWidget {
  const _View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<Model>();

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(onPressed: model.inc1, child: Text('one')),
          ElevatedButton(onPressed: model.inc2, child: Text('two')),
          ElevatedButton(onPressed: () {}, child: Text('complex')),
          _OneWidget(),
          _TwoWidget(),
          _ThreeWidget(),
          _FourWidget()
        ],
      )),
    );
  }
}

class _OneWidget extends StatelessWidget {
  const _OneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().one;

    return Text('$value');
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().two;

    return Text('$value');
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text('$value');
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text('$value');
  }
}
