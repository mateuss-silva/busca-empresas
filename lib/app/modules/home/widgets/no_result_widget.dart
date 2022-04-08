import 'package:flutter/material.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/no_result.png",
            height: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Empresa não encontrada',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
