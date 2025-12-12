import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", height: 200, width: 200),

          SizedBox(height: 20),

          Text(
            "Welcome",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hint: Text("e.g.- Ritik Rana"),
                    label: Text("Username"),
                  ),
                ),

                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(label: Text("Password")),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: Text("LOGIN"),
          ),
        ],
      ),
    );
  }
}
