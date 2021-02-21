import 'package:flutter/material.dart';
import 'package:h4h/main.dart';
import './styleguide.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
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
