// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MyCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;

  const MyCustomTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    required this.hintText,
  });

  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  bool visibility = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.051),
      child: TextField(
        controller: widget.controller,
        obscureText: visibility ? false : widget.obscureText,
        decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? Icon(
                            Icons.visibility_off,
                            size: height * 0.024,
                          )
                        : Icon(
                            Icons.remove_red_eye,
                            size: height * 0.024,
                          ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: height * 0.0199),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )),
      ),
    );
  }
}
