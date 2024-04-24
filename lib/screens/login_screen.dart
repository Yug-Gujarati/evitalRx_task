import 'package:evitarx/component/custome_button.dart';
import 'package:evitarx/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../component/custome_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final mobile = "9033006262";
  final password = "eVital@12";
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      if (mobileController.text == mobile && passwordController.text == password) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Success"),
          ),
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Wrong UserName or Password"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Image.asset(
                  "assets/logo.png",
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                Text(
                  "Login",
                  style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 35),
                ),
                Text(
                  "Enter Detail to login to your account",
                  style: TextStyle(color: Colors.blue[900], fontSize: 12),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: mobileController,
                        keyboardType: KeyboardType.number,
                        hintText: 'enter your Mobile',
                        errortext: "Please enter Mobile",
                        icon: Icons.call,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          } else if (value.length != 10) {
                            return 'Please Enter 10 Digit Mobile Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomTextField(
                        controller: passwordController,
                        keyboardType: KeyboardType.text,
                        hintText: "enter your password",
                        errortext: "enter password",
                        icon: Icons.remove_red_eye_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      CustomButton(
                        text: "Log in",
                        onTap: () {
                          if (_formKey.currentState?.validate() == true) {
                            login();
                          }
                        },
                        color: const Color.fromARGB(255, 13, 71, 161),
                        borderColor: const Color.fromARGB(255, 13, 71, 161),
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
