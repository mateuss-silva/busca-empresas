import 'package:empresas_flutter/app/modules/home/blocs/home/home_bloc.dart';
import 'package:empresas_flutter/app/shared/models/investor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:empresas_flutter/app/modules/home/home_controller.dart';
import 'package:empresas_flutter/app/modules/home/widgets/input_search_widget.dart';
import 'package:empresas_flutter/app/modules/home/widgets/top_gradient_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HomePage extends StatefulWidget {
  final InvestorModel investor;
  const HomePage({Key? key, required this.investor}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.investor);

    controller.homeStream.listen((state) {
      if (state is HomeLoadingState) {
        context.loaderOverlay.show();
      } else if (state is HomeErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(state.message),
          backgroundColor: Theme.of(context).errorColor,
        ));
      } else {
        context.loaderOverlay.hide();
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
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
          BlocBuilder<HomeBloc, HomeState>(
            bloc: controller.homeBloc,
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.enterprises.length,
                  itemBuilder: (context, index) {
                    final enterprise = state.enterprises[index];
                    //TODO fazer card com informações da empresa
                    return ListTile(
                      title: Text(enterprise.name),
                      subtitle: Text(enterprise.description!),
                      onTap: () {
                        //Modular.to.pushNamed('/enterprise');
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _onSelectSuggestion(int id) {
    //Modular.to.pushNamed('/enterprise-description/$id');
  }
}
