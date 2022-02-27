import 'package:blood_donation/widget/my_botton.dart';
import 'package:blood_donation/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  static const String screenRoute = 'registerScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 90,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      //                        color: Color.fromARGB(255, 112, 12, 12),

                      Text(
                    "REGISTER",
                    style: GoogleFonts.robotoCondensed(
                      letterSpacing: 2,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFd20202),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTextField(
                    labelText: "Enter your name", prefixIcon: Icons.person),
                DefaultTextField(
                    labelText: "Chosse your blood type",
                    prefixIcon: Icons.bloodtype),
                DefaultTextField(
                    labelText: "Enter your email", prefixIcon: Icons.email),
                DefaultTextField(
                  labelText: "Enter your Password",
                  prefixIcon: Icons.lock,
                  obsecure: true,
                ),
                DefaultTextField(
                  labelText: "Confirm your Password",
                  prefixIcon: Icons.lock,
                  obsecure: true,
                ),
                MyButton(
                  textColor: Colors.white,
                  color: const Color(0xFFd20202),
                  title: "Register",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "loginScreen");
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFd20202),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
