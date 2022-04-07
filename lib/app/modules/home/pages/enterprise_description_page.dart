import 'package:empresas_flutter/app/modules/home/controllers/enterprise_description_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnterpriseDescriptionPage extends StatefulWidget {
  final String title;
  const EnterpriseDescriptionPage({Key? key, this.title = 'CompanyDescriptionPage'}) : super(key: key);
  @override
  EnterpriseDescriptionPageState createState() => EnterpriseDescriptionPageState();
}
class EnterpriseDescriptionPageState extends ModularState<EnterpriseDescriptionPage, EnterpriseDescriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const[],
      ),
    );
  }
}