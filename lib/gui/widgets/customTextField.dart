import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key, this.controller, this.hintText, this.width, this.onChanged,})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 40.0,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 3.0,
              blurRadius: 3.0,
              color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.3) : Colors.transparent
          )
        ]
      ),
      child: FocusScope(
        onFocusChange: (v) {
          setState(() {
            isSelected = v;
          });
        },
        child: TextFormField(
          controller: widget.controller,
          cursorColor: Theme.of(context).primaryColor,
          style: const TextStyle(fontSize: 12.0, height: 1.5,),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                    width: 2.0,
                    color: Theme.of(context).primaryColor
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 2.0,
                )),
            prefixIcon: Icon(
              Icons.search_rounded,
              color: Colors.grey[400],
            ),
            fillColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
