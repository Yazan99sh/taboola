import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? valueChanged;
  final IconData? iconData;
  final TextInputType? textInputType;
  final bool validText;

  const InputField(
      {Key? key,
        this.textInputType,
        this.iconData,
        this.errorText,
        this.controller,
        this.valueChanged,
        this.validText = false,
        this.hintText})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0 , right: 30.0 , top: 10.0 , bottom: 15.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              style:  TextStyle(color: Theme.of(context).primaryColor),
              onChanged: widget.valueChanged,
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Icon(
                    widget.iconData,
                    size: 35,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: widget.hintText,
                hintStyle:
                 TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.5)),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        if (widget.validText)
          Container(
              alignment: Alignment.bottomLeft,
              padding:const EdgeInsets.only(left: 40.0 ),
              child: Text(
                widget.errorText ?? "",
                style: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.5)),
              )
          ),
      ],
    );
  }
}
