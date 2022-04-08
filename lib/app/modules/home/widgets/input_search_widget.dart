import 'package:empresas_flutter/app/shared/models/enterprise_model.dart';
import 'package:empresas_flutter/app/shared/utils/color_scheme_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:substring_highlight/substring_highlight.dart';

class InputSearchWidget extends StatefulWidget {
  final Function(String) onChange;
  final Future<List<EnterpriseModel>> Function(String)
      onChangeSearchReturnSuggestions;
  final Function(int) onSelectSuggestion;
  final Function(String) onFieldSubmitted;
  final TextEditingController controller;
  const InputSearchWidget({
    Key? key,
    required this.onChange,
    required this.onChangeSearchReturnSuggestions,
    required this.onSelectSuggestion,
    required this.onFieldSubmitted,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputSearchWidget> createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TypeAheadField<EnterpriseModel>(
        suggestionsCallback: widget.onChangeSearchReturnSuggestions,
        suggestionsBoxDecoration:
            SuggestionsBoxDecoration(borderRadius: BorderRadius.circular(4)),
        onSuggestionSelected: (EnterpriseModel enterprise) {
          widget.controller.text = enterprise.name;
          widget.onChange(enterprise.name);
          widget.onSelectSuggestion(enterprise.id);
        },
        textFieldConfiguration: TextFieldConfiguration(
          onChanged: widget.onChange,
          controller: widget.controller,
          onSubmitted: widget.onFieldSubmitted,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          decoration: InputDecoration(
            hintText: "Pesquise por empresa",
            fillColor: ColorSchemeHelper.inputBackground,
            filled: true,
            hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                  color: const Color(0xFF8B8B8B),
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Icon(CupertinoIcons.search,
                  color: Theme.of(context).iconTheme.color, size: 24),
            ),
            isDense: true,
          ),
          textInputAction: TextInputAction.search,
        ),
        itemBuilder: (context, EnterpriseModel enterprise) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: SubstringHighlight(
                text: enterprise.name,
                term: widget.controller.text,
                textAlign: TextAlign.center,
                textStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 11,
                    ),
              ),
            ),
            dense: true,
          );
        },
        errorBuilder: (context, error) {
          return Center(
            child: Text(error.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 14,
                      color: Theme.of(context).errorColor,
                      fontWeight: FontWeight.w400,
                    )),
          );
        },
        noItemsFoundBuilder: (context) {
          return Center(
            child: Text("Nenhum resultado encontrado",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    )),
          );
        },
      ),
    );
  }
}
