import 'package:flutter/material.dart';

class GradientBackgroundWidget extends StatelessWidget {
  final List<Color> colors;
  const GradientBackgroundWidget({
    Key? key,
    this.colors = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
    );
  }
}
