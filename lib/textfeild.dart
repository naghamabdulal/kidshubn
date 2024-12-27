import 'package:flutter/material.dart';

class textfeild extends StatelessWidget {
  String hint;
  Function (String) f;
  textfeild({required this.f,required this.hint, super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      keyboardType: TextInputType.number,
      decoration:
      InputDecoration(border: OutlineInputBorder(),hintText: hint),
      onChanged:(t){ f(t);
      },
    );
  }
}
