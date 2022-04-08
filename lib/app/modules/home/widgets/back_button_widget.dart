import 'package:empresas_flutter/app/shared/utils/color_scheme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Modular.to.pop(),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        primary: ColorSchemeHelper.inputBackground,
        elevation: 0,
      ),
      child: Icon(
        CupertinoIcons.back,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
