import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/controllers/auth_service_email.dart';
import 'package:phone_auth/screens/admin_screen/userList.dart';
import '../../../shared/styles/defaultStyles.dart';
//import '../styles/defaultStyles.dart';

class LoginSignupPage extends StatefulWidget {
  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoginForm = true;
  late String _email, _password,_firstname,_lastname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Color.fromARGB(255, 0, 0, 0)),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                    child: Column(
                      children: [
                        TextFormField(
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal),
                          //obscureText: obscureText,
                          decoration: InputDecoration(
                            border: textFieldBorder,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Your Email",
                          ),
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          onSaved: (input) => _email = input!,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            border: textFieldBorder,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter Your Password",
                          ),
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          onSaved: (input) => _password = input!,
                        ),
                        SizedBox(height: 10.0),
                        const Divider(
                          thickness: 2,
                          indent: 20,
                          endIndent: 20,
                          color: Colors.white,
                        ),
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
                              _isLoginForm ? "Login" : 'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            //'/home',
                            '/signup',
                            (route) => false,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(borderRadius1),
                              color: Color(0xffD4F11D),
                            ),
                            child: Text(
                              _isLoginForm
                                  ? 'Create an account'
                                  : 'Have an account? Sign in',
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
      ),
    );
  }

  // void _toggleForm() {
  //   setState(() {
  //     _isLoginForm = !_isLoginForm;
  //   });
  // }
  void _toggleForm() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      //'/home',
      '/age',
      (route) => false,
    );
  }

  void _submit() async {
    final form = _formKey.currentState;

    const loginAdmin="clerk@clerk.com";
    // const passwordAdmin="clerk123";

    AuthService authService = AuthService();
    if (form!.validate()) {
      form.save();
      if (_isLoginForm) {
        User? user =
            await authService.signInWithEmailAndPassword(_email, _password);
          
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
            if(user.email==loginAdmin ){
                 Navigator.pushNamedAndRemoveUntil(
            context,
            //'/home',
            '/admin',
            (route) => false,
          );
            }else{
                Navigator.pushNamedAndRemoveUntil(
            context,
            //'/home',
            '/home',
            (route) => false,
          );
            }
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => UserListPage()),
          // );
        } else {
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
      } 
    }
  }
}
