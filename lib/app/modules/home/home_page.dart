import 'package:empresas_flutter/app/modules/home/blocs/home/home_bloc.dart';
import 'package:empresas_flutter/app/modules/home/widgets/enterprise_card_widget.dart';
import 'package:empresas_flutter/app/modules/home/widgets/no_result_widget.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
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
      resizeToAvoidBottomInset: false,
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
              if (state.enterprises.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.only(top: 32),
                  child: NoResultWidget(),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: state.enterprises.length,
                  itemBuilder: (context, index) {
                    final enterprise = state.enterprises[index];

                    if (index == 0) {
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 16.0, left: 24, right: 24),
                              child: Text(
                                  '${state.enterprises.length.toString().padLeft(2, "0")} resultados encontrados'),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: EnterpriseCardWidget(enterprise: enterprise),
                          ),
                        ],
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: EnterpriseCardWidget(enterprise: enterprise),
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

  _onSelectSuggestion(EnterpriseModel enterprise) {
    Modular.to.pushNamed('/home/enterprise-description/${enterprise.id}', arguments: enterprise);
  }
}
