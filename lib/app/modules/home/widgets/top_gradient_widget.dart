import 'package:empresas_flutter/app/modules/home/widgets/gradient_background_widget.dart';
import 'package:flutter/material.dart';

class TopGradientWidget extends StatelessWidget {
  const TopGradientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: const Offset(0, -24),
          child: const GradientBackgroundWidget(
            colors: [
              Color(0xFFAF1A7D),
              Color(0xFF9027B2),
            ],
          ),
        ),
        Transform.translate(
          offset: const Offset(0, 24),
          child: const GradientBackgroundWidget(
            colors: [
              Color(0xFFAF1A7D),
              Color(0xFF9027B2),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Image.asset("assets/logo_opaque_bottom_left.png",
              height: 100, width: 100),
        ),
        Positioned(
          left: 0,
          right: 0,
          child: Image.asset("assets/logo_opaque_center.png",
              height: 150, width: 150),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/logo_opaque_bottom_right.png",
              height: 100, width: 100),
        ),
      ],
    );
  }
}
