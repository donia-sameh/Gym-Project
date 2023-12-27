// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:phone_auth/globals/globals.dart';
import 'package:phone_auth/services/databaseService.dart';
import 'package:phone_auth/shared/customWidgets/CustomTextField.dart';
import '../../../shared/styles/defaultStyles.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  DatabaseService _db = DatabaseService();
  TextEditingController _emailLoginController = TextEditingController();
  TextEditingController _passwordLoginController = TextEditingController();

  String email = "";
  String password = "";
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUsers();
  }

  checkUsers() async {
    List user = await _db.readData("select * from user");
    print(user);
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
             crossAxisAlignment: CrossAxisAlignment.center, 
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            name: "Email",
                            
                            width: 260,
                            obscureText: false,
                            hintText: "Email",
                            controller: _emailLoginController,
                            validate: () {
                              ValidationBuilder().email().build();
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextField(
                            name: "Password",
                            width: 260,
                            obscureText: true,
                            hintText: "Enter Your Password",
                            controller: _passwordLoginController,
                            validate: () {
                              ValidationBuilder().minLength(8).maxLength(32);
                            },
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 250)),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Forget Password ?",
                              style: linkStyle.copyWith(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () async {
                          email = _emailLoginController.text;
                          password = _passwordLoginController.text;
                          print("$email : $password");

                          try {
                            List users = await _db.readData('''
                            select userId, email, password 
                            from user
                            where email = '$email' AND password = '$password';
                        ''');

                            List clerk = await _db.readData('''
                            select clerk_id ,email, password 
                            from clerk
                            where email = '$email' AND password = '$password';
                        ''');
                            /* print(users);
                          print(users.first['userId']); */
                            if (users.isNotEmpty) {
                              Globals.addUserId(users.first['userId']);
                              final snackBar = SnackBar(
                                content: AwesomeSnackbarContent(
                                  title: 'Success',
                                  message: 'Logged into your account',
                                  contentType: ContentType.success,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                //'/home',
                                 '/age',
                                (route) => false,
                              );
                            } else if (clerk.isNotEmpty) {
                              final snackBar = SnackBar(
                                content: AwesomeSnackbarContent(
                                  title: 'Success',
                                  message: 'Logged into your account',
                                  contentType: ContentType.success,
                                ),
                              );
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                '/admin',
                                (route) => false,
                              );
                              // print(quary);

                            }
                          } catch (e) {
                            final snackBar = SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'failure',
                                message: 'email or password is wrong!',
                                contentType: ContentType.failure,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                          email = '';
                          password = '';
                          _emailLoginController.text = email;
                          _passwordLoginController.text = password;
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(borderRadius1),
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
        ],
      ),
    );
  }
}
