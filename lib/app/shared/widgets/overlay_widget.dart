import 'package:empresas_flutter/app/shared/utils/color_scheme_helper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class OverlayWidget extends StatelessWidget {
  const OverlayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: const SizedBox(
                height: 48,
                width: 48,
                child: CircularProgressIndicator(
                    color: ColorSchemeHelper.progressIndicatorColor)),
          ),
          const SizedBox(
              height: 72,
              width: 72,
              child: CircularProgressIndicator(
                  color: ColorSchemeHelper.progressIndicatorColor)),
        ],
      ),
    );
  }
}
