import 'package:flutter/material.dart';

class MyTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final bool obcuretext;
  const MyTextFiled({
    super.key,
    required this.controller,
    required this.hintext,
    required this.obcuretext,
  });

  @override
  Widget build(BuildContext context) {
    return (TextField(
      obscureText: obcuretext,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintext,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    ));
  }
}
