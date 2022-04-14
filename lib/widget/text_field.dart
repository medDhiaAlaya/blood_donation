import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    required this.labelText,
    required this.prefixIcon,
    this.obsecure = false,
    required this.onChanged,
  });
  final String labelText;
  late Function onChanged;
  final IconData prefixIcon;
  late bool obsecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(

        onChanged: (value){},

          obscureText: obsecure,
          cursorColor: const Color.fromARGB(255, 112, 12, 12),
          decoration: InputDecoration(
            focusColor: const Color.fromARGB(255, 112, 12, 12),
            prefixIcon: Icon(
              prefixIcon,
              color: const Color(0xFFd20202),
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Color.fromARGB(255, 112, 12, 12),
            ),
            fillColor: const Color.fromARGB(255, 112, 12, 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(
                width: 3,
                color: Color.fromARGB(255, 112, 12, 12),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 112, 12, 12),
                width: 2.0,
              ),
            ),
          )),
    );
  }
}
