import 'package:empresas_flutter/app/modules/home/bloc/home_bloc.dart';
import 'package:empresas_flutter/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final HomeBloc _counter = Modular.get();

  @override
  void dispose() {
    _counter.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.remove),
        onPressed: () => _counter.add(const IncrementEvent()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Button Tapped:"),
            BlocBuilder<HomeBloc, HomeState>(
              bloc: _counter,
              builder: (context, count) {
                return Text(
                  "${count.value}",
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
