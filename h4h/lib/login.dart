import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:h4h/main.dart';
import './styleguide.dart';
import 'package:h4h/globalWidgets/GlobalVars.dart' as Globals;

class Login extends StatelessWidget {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  _login(BuildContext cont) async {
    print('working...');
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    Globals.email = _emailController.text;
    MaterialPageRoute(
      builder: (cont) => MyApp(),
    );
  }

  @override
  Widget build(BuildContext cont) {
    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 50.0, right: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hey there,",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's get started.",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 28.0),
            TextField(
              controller: _emailController,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                suffixIcon: Icon(Icons.person_rounded, color: LimeGreen),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: LightGrey,
                filled: true,
              ),
              cursorColor: LimeGreen,
            ),
            SizedBox(height: 24.0),
            TextField(
              controller: _passwordController,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(20),
                suffixIcon: Icon(Icons.vpn_key_rounded, color: LimeGreen),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: LightGrey,
                filled: true,
              ),
              cursorColor: LimeGreen,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  "New here? / ",
                  style: TextStyle(
                    color: Grey,
                    fontSize: 16.0,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 125.0),
            Container(
              width: double.infinity,
              height: 60.0,
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: LimeGreen,
                onPressed: () {
                  print('Working');
                  _login(cont);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
