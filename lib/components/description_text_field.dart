import 'package:flutter/material.dart';
import 'package:social_media_app/components/custom_card.dart';

class DescriptionFormBuilder extends StatefulWidget {
  final String? initialValue;
  final bool? enabled;
  final InputDecoration? decoration;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FocusNode? focusNode, nextFocusNode;
  final VoidCallback? submitAction;
  final FormFieldValidator<String>? validateFunction;
  final void Function(String)? onSaved, onChange;
  final Key? key;
  final IconData? prefix;
  final IconData? suffix;

  DescriptionFormBuilder(
      {this.prefix,
      this.suffix,
      this.initialValue,
      this.enabled,
      this.decoration,
      this.textInputType,
      this.controller,
      this.textInputAction,
      this.nextFocusNode,
      this.focusNode,
      this.submitAction,
      this.obscureText = false,
      this.validateFunction,
      this.onSaved,
      this.onChange,
      this.key});

  @override
  _DescriptionFormBuilderState createState() => _DescriptionFormBuilderState();
}

class _DescriptionFormBuilderState extends State<DescriptionFormBuilder> {
  String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCard(
            onTap: () {
            },
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              child: Theme(
                data: ThemeData(
                  primaryColor: Theme.of(context).colorScheme.secondary,
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                      secondary: Theme.of(context).colorScheme.secondary),
                ),
                child: TextFormField(
                  cursorColor: Theme.of(context).colorScheme.secondary,
                  textCapitalization: TextCapitalization.none,
                  initialValue: widget.initialValue,
                  enabled: widget.enabled,
                  onChanged: (val) {
                    error = widget.validateFunction!(val);
                    setState(() {});
                    widget.onSaved!(val);
                  },
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  key: widget.key,
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  keyboardType: widget.textInputType,
                  validator: widget.validateFunction,
                  onSaved: (val) {
                    error = widget.validateFunction!(val);
                    setState(() {});
                    widget.onSaved!(val!);
                  },
                  textInputAction: widget.textInputAction,
                  focusNode: widget.focusNode,
                  onFieldSubmitted: (String term) {
                    if (widget.nextFocusNode != null) {
                      widget.focusNode!.unfocus();
                      FocusScope.of(context).requestFocus(widget.nextFocusNode);
                    } else {
                      widget.submitAction!();
                    }
                  },
                  decoration: widget.decoration,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Visibility(
            visible: error != null,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                '$error',
                style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(
        color: Colors.white,
        width: 0.0,
      ),
    );
  }

  focusBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1.0,
      ),
    );
  }
}