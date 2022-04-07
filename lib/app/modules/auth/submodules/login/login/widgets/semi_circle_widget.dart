import 'package:flutter/material.dart';

class SemiCircleWidget extends StatelessWidget {
  SemiCircleWidget({Key? key}) : super(key: key);

  final viewController = TransformationController();

  @override
  Widget build(BuildContext context) {
    viewController.value.setEntry(0, 0, 1.4);
    viewController.value.setEntry(0, 3, -70);
    return Stack(
      alignment: Alignment.center,
      children: [
        InteractiveViewer(
          transformationController: viewController,
          scaleEnabled: false,
          panEnabled: false,
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  const Color(0xFFa589a7),
                  Theme.of(context).primaryColor,
                  const Color(0xFFa589a7),
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(200),
                bottomRight: Radius.circular(200),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Image.asset("assets/logo.png", height: 32, width: 40),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text("Seja bem vindo ao empresas!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      )),
            ),
          ],
        )
      ],
    );
  }
}
