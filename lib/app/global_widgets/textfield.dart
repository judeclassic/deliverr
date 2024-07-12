import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'package:donitaa_client/common/strings/resources.dart';
import 'package:donitaa_client/common/styles/styles.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.onSaved,
      required this.hintText,
      required this.labelText,
      this.textInputAction,
      this.initialVal,
      this.controller,
      this.validator,
      this.formatter,
      this.textFormatters})
      : super(key: key);

  final FormFieldSetter<String> onSaved;
  final TextInputAction? textInputAction;
  final String hintText;
  final String labelText;
  final String? initialVal;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? formatter;
  final List<TextInputFormatter>? textFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: grey, blurRadius: 10, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            labelText,
            textAlign: TextAlign.start,
            style: title4(12, black),
          ),
          formatter == null
              ? initialVal != null
                  ? TextFormField(
                      onSaved: onSaved,
                      initialValue: initialVal != null ? initialVal : '',
                      controller: controller,
                      textInputAction: textInputAction,
                      validator: validator,
                      inputFormatters: textFormatters,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: title4(
                          13,
                          black.withOpacity(.3),
                        ),
                      ),
                    )
                  : TextFormField(
                      onSaved: onSaved,
                      controller: controller,
                      textInputAction: textInputAction,
                      validator: validator,
                      inputFormatters: textFormatters,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: title4(
                          13,
                          black.withOpacity(.3),
                        ),
                      ),
                    )
              : initialVal != null
                  ? TextFormField(
                      onSaved: onSaved,
                      inputFormatters: [PhoneInputFormatter()],
                      initialValue: initialVal != null ? initialVal : '',
                      textInputAction: textInputAction,
                      controller: controller,
                      validator: validator,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: title4(
                          13,
                          black.withOpacity(.3),
                        ),
                      ),
                    )
                  : TextFormField(
                      onSaved: onSaved,
                      inputFormatters: [PhoneInputFormatter()],
                      controller: controller,
                      textInputAction: textInputAction,
                      validator: validator,
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: title4(
                          13,
                          black.withOpacity(.3),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
