import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/repositories/base_api.dart';
import 'package:flutter/material.dart';

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
                //Modular.to.pushNamed('/enterprise');
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Hero(
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
                ),
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
