import 'package:flutter/material.dart';
import 'package:phone_auth/screens/loginscreen/LoginPageEmail.dart';
//import 'package:phone_auth/screens/loginscreen/login_page.dart';

class StartLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Methods'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to email/password login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignupPage()),
                );
              },
              child: Text('Login with Email/Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to phone number login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSignupPage()),
                );
              },
              child: Text('Login with Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}
