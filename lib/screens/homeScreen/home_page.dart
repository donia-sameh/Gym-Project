import 'package:flutter/material.dart';
import 'package:phone_auth/controllers/auth_service.dart';
import 'package:phone_auth/screens/loginscreen/LoginPageEmail.dart';
//import 'package:phone_auth/screens/loginscreen/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Great you are now logged in."),
          SizedBox(
            height: 20,
          ),
          OutlinedButton(
              onPressed: () {
                AuthService.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginSignupPage()));
              },
              child: Text("Logout"))
        ],
      )),
    );
  }
}
