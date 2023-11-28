import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gym_project/shared/customWidgets/CustomDropDown.dart';
import 'package:gym_project/shared/customWidgets/Custom_buttom.dart';
import 'package:gym_project/shared/styles/defaultStyles.dart';

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
  DatabaseService _db = DatabaseService();
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
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            name: "Verify Your Password",
                            width: 260,
                            obscureText: true,
                            hintText: "ReEnter Your Password",
                            controller: _verifyPasswordController,
                            validate: (() {
                              ValidationBuilder()
                                  .minLength(8)
                                  .maxLength(32)
                                  .build();
                            }),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* CustomTextField(
                            obscureText: false,
                            name: "Date of birth",
                            width: 150,
                            hintText: "Enter Your Birth date",
                            controller: _dobController,
                          ), */
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Date of birth",
                                style: tabTextStyle.copyWith(color: crWhite),
                              ),
                              InkWell(
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2100),
                                  );
                                  /* If "Cancel" => null */
                                  if (newDate == null) return;
                                  /* if 'OK' => DateTime */
                                  setState(() => date = newDate);
                                  // print(date);
                                },
                                child: Ink(
                                  width: 140,
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(borderRadius2),
                                    border:
                                        Border.all(color: crWhite, width: 1),
                                  ),
                                  child: Text(
                                    "${date.year}/${date.month}/${date.day}",
                                    style: textStyle.copyWith(color: crWhite),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          CustomDropDown(
                            dropdownName: "Gender",
                            selectedValue: selectedGender,
                            valuesList: gendersList,
                            width: 100,
                            color: crWhite,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            name: "Address",
                            width: 260,
                            obscureText: false,
                            hintText: "Enter Your Address",
                            controller: _addressController,
                            validate: () {},
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          CustomTextField(
                            name: "Phone Number",
                            width: 260,
                            obscureText: false,
                            hintText: "Enter Your Phone Number",
                            controller: _phoneNumberController,
                            validate: () {
                              ValidationBuilder().phone().build();
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
                      CustomButtom(
                        text: 'Sign Up',
                        width: MediaQuery.of(context).size.width,
                        pressed: () async {
                          try {
                            var respone = await _db.insertData('''
                           insert into user(
                           firstName,
                           lastName,
                           email,
                           password,
                           address,
                           phoneNumber,
                           gender
                           )
                           
                           values('${_fnameController.text}',
                           '${_lnameController.text}',
                           '${_emailController.text}',
                           '${_passwordController.text}',
                           '${_addressController.text}',
                           '${_phoneNumberController.text}',
                           '${selectedGender}'
                           

                           )
                            ''');
                            print(respone);
                            final snackBar = SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'Success',
                                message: 'Successfully created an account',
                                contentType: ContentType.success,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          } catch (e) {
                            final snackBar = SnackBar(
                              content: AwesomeSnackbarContent(
                                title: 'failed',
                                message: "something went wrong!",
                                contentType: ContentType.failure,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
                          }
                          _fnameController.text = '';
                          _lnameController.text = '';
                          _addressController.text = '';
                          _passwordController.text = '';
                          _verifyPasswordController.text = '';
                          _phoneNumberController.text = '';
                        },
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "Have An Account ? "),
                            TextSpan(
                              text: "Login",
                              style: linkStyle,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.pushNamed(
                                        context,
                                        '/login',
                                      )
                                    },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
