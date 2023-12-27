// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phone_auth/screens/loginscreen/login_screen.dart';
import '../../../shared/styles/defaultStyles.dart';
import '../../services/databaseService.dart';

import '../SignupScreen/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseService _db = DatabaseService();

  void initState() {
    super.initState();
    checkAdmin();
  }

  /* Checking if there is a admin email if not create a new email */
  void checkAdmin() async {
    List admin = await _db.readData('''
        select clerk_id ,email, password
        from clerk
        where email = 'clerk@clerk.com' AND password = 'clerk';
    ''');

    print(admin);
    if (admin.isNotEmpty) {
      print("clerk account is here");
    } else {
      print("there is no clerk account");
      int response = await _db.insertData('''
        insert into clerk(first_name, last_name ,email, password, phonenumber)
                    values('clerk', 'clerk' ,'clerk@clerk.com', 'clerk', '010920456712');
      ''');

      response == 0
          ? print("something went wrong when creating clerk account!")
          : print("created clerk account");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/splashImage.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          /* crossAxisAlignment: CrossAxisAlignment.center, */
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(0xff0D0D0D)),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: Column(
                  children: [
                    Text("welcome to our app".toUpperCase(), style: titleStyle),
                    SizedBox(height: 10),
                    Text(
                      "Here You Can Lose Weight From Classes",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () => {
                        Navigator.pushNamed(context, '/login'),
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffD4F11D),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "don’t have an account ? "),
                          TextSpan(
                            text: "Sign up",
                            style: linkStyle,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.pushNamed(context, '/signup'),
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        /* Container(
          decoration: BoxDecoration(color: Color(0xff0D0D0D)),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Column(),
        ) */
      ],
    ));
  }
}
