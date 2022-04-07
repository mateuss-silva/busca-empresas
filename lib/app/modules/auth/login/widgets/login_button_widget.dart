import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final Function() onPressed;
  const LoginButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text("ENTRAR",
          style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              )),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
