import 'package:empresas_flutter/app/modules/home/blocs/enterprise_description/enterprise_description_bloc.dart';
import 'package:empresas_flutter/app/modules/home/controllers/enterprise_description_controller.dart';
import 'package:empresas_flutter/app/modules/home/widgets/back_button_widget.dart';
import 'package:empresas_flutter/app/modules/home/widgets/enterprise_image_widget.dart';
import 'package:empresas_flutter/app/modules/home/widgets/social_media_widget.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/widgets/overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnterpriseDescriptionPage extends StatefulWidget {
  final EnterpriseModel enterprise;
  const EnterpriseDescriptionPage({Key? key, required this.enterprise})
      : super(key: key);
  @override
  EnterpriseDescriptionPageState createState() =>
      EnterpriseDescriptionPageState();
}

class EnterpriseDescriptionPageState extends ModularState<
    EnterpriseDescriptionPage, EnterpriseDescriptionController> {
  @override
  void initState() {
    super.initState();
    controller.init(widget.enterprise);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: BackButtonWidget(),
        ),
      ),
      body: BlocBuilder<EnterpriseDescriptionBloc, EnterpriseDescriptionState>(
          bloc: controller.enterpriseDescriptionBloc,
          builder: (context, state) {
            if (state.enterprise == null) {
              return const OverlayWidget();
            }

            var enterprise = state.enterprise!;

            return ListView(padding: const EdgeInsets.all(24), children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: EnterpriseImageWidget(enterprise: enterprise),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          enterprise.name,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.place,
                                color: Colors.grey[700], size: 20),
                            Text(
                              "${enterprise.city}, ${enterprise.country}",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quantidade de ações: ${enterprise.shares ?? "A definir"}",
                            style: Theme.of(context).textTheme.overline,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Valor por ação \$ ${enterprise.sharePrice?.toInt() ?? "A definir"}",
                            style: Theme.of(context).textTheme.overline,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Sobre nós",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          enterprise.description ?? "Sem descrição.",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 16),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Contato",
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.subtitle2),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Email: ${enterprise.email ?? "indisponível."}",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Telefone: ${enterprise.phone ?? "indisponível."}",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  SocialMediaWidget(enterprise: enterprise),
                ],
              ),
            ]);
          }),
    );
  }
}
