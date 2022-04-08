import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:empresas_flutter/app/modules/home/home_controller.dart';
import 'package:empresas_flutter/app/modules/home/widgets/input_search_widget.dart';
import 'package:empresas_flutter/app/modules/home/widgets/top_gradient_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void dispose() {
    super.dispose();
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const TopGradientWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InputSearchWidget(
              onChangeSearchReturnSuggestions:
                  controller.onChangeSearchReturnSuggestion,
              controller: searchController,
              onChange: controller.onChangeSearch,
              onSelectSuggestion: _onSelectSuggestion,
              onFieldSubmitted: controller.onSubmitSearch,
            ),
          ),
        ],
      ),
    );
  }

  _onSelectSuggestion(int id) {
    Modular.to.pushNamed('/enterprise-description/$id');
  }
}
