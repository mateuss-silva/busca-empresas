import 'package:empresas_flutter/app/modules/home/widgets/enterprise_image_widget.dart';
import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EnterpriseCardWidget extends StatelessWidget {
  final EnterpriseModel enterprise;
  const EnterpriseCardWidget({Key? key, required this.enterprise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Modular.to.pushNamed(
                    '/home/enterprise-description/${enterprise.id}',
                    arguments: enterprise);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: EnterpriseImageWidget(enterprise: enterprise),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                enterprise.name,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 18,
                    ),
              ),
            ),
          ],
        ));
  }
}
