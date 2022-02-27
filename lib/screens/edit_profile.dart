import 'package:blood_donation/screens/profile_screen.dart';
import 'package:blood_donation/widget/my_botton.dart';
import 'package:blood_donation/widget/text_field.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);
  static const String screenRoute = 'edit profile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          },
        ),
        backgroundColor: const Color(0xFFd20202),
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/1.png",
                  ),
                  radius: 50,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          DefaultTextField(labelText: "Name", prefixIcon: Icons.person),
          DefaultTextField(labelText: "Email", prefixIcon: Icons.email),
          DefaultTextField(
              labelText: "Blood type", prefixIcon: Icons.bloodtype),
          const SizedBox(
            height: 30,
          ),
          MyButton(
              color: const Color(0xFFd20202),
              textColor: Colors.white,
              title: "Save",
              onPressed: () {}),
        ],
      ),
    );
  }
}
