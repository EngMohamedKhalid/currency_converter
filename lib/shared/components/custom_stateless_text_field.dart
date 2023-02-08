import 'package:flutter/material.dart';

class CustomStatelessTextField extends StatelessWidget {
  const CustomStatelessTextField({Key? key, required this.lableText}) : super(key: key);
final String lableText;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        label: Text(
          lableText,
          style: const TextStyle(
              color: Color(0xffE5E2E2FF),
              fontSize: 16
          ),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.grey,
              width: 1.25
          ),
        ),
      ),
    );
  }
}
