import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/1.png",
                ),
                radius: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "MOHAMED DHIA ALAYA",
                style: GoogleFonts.robotoCondensed(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "DhiaAlaya3@gmail.com",
                style: GoogleFonts.robotoCondensed(
                  letterSpacing: 2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "BLOOD TYPE",
                style: GoogleFonts.robotoCondensed(
                  letterSpacing: 2,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
