import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/homepage.dart';

void main() {
  runApp(MaterialApp(home: LoginPage(), debugShowCheckedModeBanner: false));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                height: 200,
                width: 200,
              ),

              SizedBox(height: 20),

              Text(
                "Welcome $name",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 36,
                ),
                child: Column(
                  children: [
                    // USERNAME FIELD
                    TextFormField(
                      decoration: InputDecoration(
                        hint: Text("e.g.- Ritik Rana"),
                        label: Text("Username"),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username Cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),

                    SizedBox(height: 16),

                    // PASSWORD FIELD (Fixed)
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(label: Text("Password")),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password Cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              InkWell(
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: Alignment.center,
                  width: changebutton ? 50 : 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                  ),
                  child: changebutton
                      ? Icon(Icons.done, color: Colors.white)
                      : Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
