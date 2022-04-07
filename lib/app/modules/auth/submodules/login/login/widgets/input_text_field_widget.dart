import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextFieldWidget extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final bool obscureText;
  final TextEditingController? controller;

  final List<TextInputFormatter> inputFormatters;

  const InputTextFieldWidget({
    Key? key,
    this.label = "",
    this.obscureText = false,
    this.validator,
    this.onChange,
    this.keyboardType,
    this.onSubmitted,
    this.controller,
    this.inputFormatters = const [],
  }) : super(key: key);

  @override
  _InputTextFieldWidgetState createState() => _InputTextFieldWidgetState();
}

class _InputTextFieldWidgetState extends State<InputTextFieldWidget> {
  @override
  void initState() {
    super.initState();
  }

  bool isObscure = true;

  _changeVisibility() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: const Color(0xFF666666),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          onChanged: widget.onChange,
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: widget.onSubmitted != null
              ? TextInputAction.done
              : TextInputAction.next,
          validator: widget.validator,
          obscureText: widget.obscureText && isObscure,
          keyboardType: widget.keyboardType,
          enableSuggestions: false,
          autocorrect: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(255),
            ...widget.inputFormatters
          ],
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            suffixIcon: widget.obscureText
                ? InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: _changeVisibility,
                    child: isObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
