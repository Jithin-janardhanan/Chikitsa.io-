import 'package:adhicine/dashboard/empty_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../homepageWidgets/navbar.dart';

class SignInScreen extends StatelessWidget {
  bool showError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/logoo.png'),
                ),
                SizedBox(height: 50),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign In",
                      style: GoogleFonts.inter(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    icon: Icon(
                      Icons.alternate_email_outlined,
                      color: const Color.fromARGB(255, 49, 207, 170),
                    ),
                    errorText: showError ? "Incorrect Email Address" : null,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock_outline,
                      color: const Color.fromARGB(255, 49, 207, 170),
                    ),
                    suffixIcon: Opacity(
                      opacity: 0.2,
                      child: Icon(Icons.visibility_off),
                    ),
                    errorText: showError ? "Incorrect Email Address" : null,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Forgot Password?"),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 121, 140, 205),
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                  },
                  child: Text("Sign In",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 243, 241, 241),
                          fontSize: 18)),
                ),
                SizedBox(height: 20),
                Text("OR"),
                SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    padding: EdgeInsets.symmetric(horizontal: 70, vertical: 12),
                  ),
                  icon: SizedBox(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/google_logo.png'),
                  ),
                  label: Text(
                    "Continue with Google",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to Adhicine?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
