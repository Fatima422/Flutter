import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  Future login()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: _email.text.trim(), password: _pass.text.trim());
  }
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _pass.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image
                Image.asset('/Users/fatima/AndroidStudioProjects/trying/Image/شعار موجود-01.png',
                    height: 100),
                const SizedBox(height: 20),
                //Title
                Text ('Login',
                  style: GoogleFonts.robotoCondensed(
                      fontSize: 40, fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 15),
                // User
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _email,
                        decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Email"
                        ) ,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //Pass
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _pass,
                        obscureText: true,
                        decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Pass"
                        ) ,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                //Login button
                Padding(padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: login,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(child: Text('Login',
                        style: GoogleFonts.robotoCondensed(
                            fontSize: 18, fontWeight: FontWeight.bold
                        ),
                      ),),
                    ),
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
