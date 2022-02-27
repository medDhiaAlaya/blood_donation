import 'package:blood_donation/widget/my_botton.dart';
import 'package:blood_donation/widget/text_field.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 15,
      ),
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            DefaultTextField(labelText: "Name", prefixIcon: Icons.person),
            DefaultTextField(
                labelText: "Contact number", prefixIcon: Icons.phone),
            DefaultTextField(labelText: "Blood type", prefixIcon: Icons.person),
            DefaultTextField(
                labelText: "Medical center", prefixIcon: Icons.home),
            DefaultTextField(
                labelText: "Request date", prefixIcon: Icons.date_range),
            DefaultTextField(
                labelText: "Note(optional)", prefixIcon: Icons.note),
            const SizedBox(
              height: 20,
            ),
            MyButton(
                color: const Color(0xFFd20202),
                textColor: Colors.white,
                title: "Submit",
                onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
