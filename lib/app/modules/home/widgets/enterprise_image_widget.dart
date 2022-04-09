import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:flutter/material.dart';

class EnterpriseImageWidget extends StatelessWidget {
  final EnterpriseModel enterprise;
  const EnterpriseImageWidget({Key? key, required this.enterprise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: enterprise.id,
      child: Image.network(
        "${BaseApi.baseUrl}${enterprise.photo ?? ''}",
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/logo.png',
            color: Theme.of(context).primaryColor,
            fit: BoxFit.fill,
            height: 160,
          );
        },
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SizedBox(
            height: 160,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
