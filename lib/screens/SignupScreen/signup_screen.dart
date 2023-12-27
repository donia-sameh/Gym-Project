import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:phone_auth/shared/customWidgets/CustomDropDown.dart';
import 'package:phone_auth/shared/customWidgets/Custom_buttom.dart';
import 'package:phone_auth/shared/styles/defaultStyles.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:phone_auth/controllers/auth_service_email.dart';
import '../../shared/customWidgets/CustomTextField.dart';
import '../../../shared/styles/defaultStyles.dart';
import '../loginscreen/login_screen.dart';
import '../../services/databaseService.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //DatabaseService _db = DatabaseService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _verifyPasswordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  String selectedGender = 'Male';
  List<String> gendersList = ['Male', 'Female'];
  late String _email, _password,_firstname,_lastname;
//,_firstname,_lastname,_phonenumber;
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
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
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color(0xff0D0D0D)),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          CustomTextField(
                            obscureText: false,
                            name: "First Name",
                            width: 150,
                            hintText: "First Name",
                            controller: _fnameController,
                            validate: () {
                              ValidationBuilder()
                                  .minLength(10)
                                  .maxLength(50)
                                  .build();
                            },
                          ),
                          SizedBox(width: 10),
                          CustomTextField(
                            obscureText: false,
                            name: "Last name",
                            width: 100,
                            hintText: "Last Name",
                            controller: _lnameController,
                            validate: () {
                              ValidationBuilder()
                                  .minLength(10)
                                  .maxLength(50)
                                  .build();
                                  
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            name: "Email",
                            width: 260,
                            obscureText: false,
                            hintText: "Enter Your Email",
                            controller: _emailController,
                            validate: () {
                              ValidationBuilder().email().build();
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            name: "Password",
                            width: 260,
                            obscureText: true,
                            hintText: "Enter Your Password",
                            controller: _passwordController,
                            validate: () {
                              ValidationBuilder()
                                  .minLength(8)
                                  .maxLength(32)
                                  .build();
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Divider(
                        thickness: 2,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                      ),
                      SizedBox(height: 10),
                      const SizedBox(height: 10),
                        InkWell(
                          onTap: _submit,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(borderRadius1),
                              color: Color(0xffD4F11D),
                            ),
                            child: Text(
                             'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
 void _submit() async {
   AuthService authService = AuthService();
User? user =
            await authService.registerWithEmailAndPassword(_emailController.text, _passwordController.text,_fnameController.text,_lnameController.text);
        if (user != null) {
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
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => LoginSignupPage()),
          // );
        } else {
          final snackBar = SnackBar(
            content: AwesomeSnackbarContent(
              title: 'failure',
              message: 'Email Already Exists!',
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
 }

  void _toggleForm() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      //'/home',
      '/age',
      (route) => false,
    );
  }
  //   _fnameController.text = '';
  //   _lnameController.text = '';
  //   _addressController.text = '';
  //   _passwordController.text = '';
  //   _verifyPasswordController.text = '';
  //   _phoneNumberController.text = '';
  // },

  // SizedBox(height: 5),
  // RichText(
  //   text: TextSpan(
  //     children: [
  //       TextSpan(text: "Have An Account ? "),
  //       TextSpan(
  //         text: "Login",
  //         style: linkStyle,
  //         recognizer: TapGestureRecognizer()
  //           ..onTap = () => {
  //                 Navigator.pushNamed(
  //                   context,
  //                   '/login',
  //                 )
  //               },
  //       ),
  //     ],
  //   ),
  // ),
}