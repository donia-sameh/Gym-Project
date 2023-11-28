import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:gym_project/models/coach.dart';
import 'package:gym_project/services/databaseService.dart';

import '../../../shared/customWidgets/CustomTextField.dart';
import '../../../shared/customWidgets/Custom_buttom.dart';
import '../../../shared/styles/defaultStyles.dart';

class CreateCoach extends StatefulWidget {
  const CreateCoach({super.key});

  @override
  State<CreateCoach> createState() => _CreateCoachState();
}

class _CreateCoachState extends State<CreateCoach> {
  DatabaseService _db = DatabaseService();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        'Create New Coach',
        style: titleStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Container(
          height: 400,
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextField(
                    name: 'First Name',
                    width: 123,
                    obscureText: false,
                    hintText: 'Enter your name',
                    colortext: Colors.black,
                    controller: _firstname,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    name: 'Last Name',
                    width: 123,
                    obscureText: false,
                    hintText: 'Enter your Last Name ',
                    colortext: Colors.black,
                    controller: _lastname,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                name: 'Phone Number',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: ' +0201000000000',
                colortext: Colors.black,
                controller: _phonenumber,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                name: 'E-mail',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: 'micheal@E-amil',
                colortext: Colors.black,
                controller: _email,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                name: 'password',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '12345678',
                colortext: Colors.black,
                controller: _password,
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                name: 'age',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '30',
                colortext: Colors.black,
                controller: _age,
              )
            ],
          ),
        ),
      ),
      actions: [
        CustomButtom(
            text: 'Create New Coach',
            width: MediaQuery.of(context).size.width,
            pressed: (() async {
              try {
                Coach coach = Coach({
                  "firstName": _firstname.text.toString(),
                  "lastName": _lastname.text.toString(),
                  "email": _email.text.toString(),
                  "password": _password.text.toString(),
                  "phoneNumber": _phonenumber.text.toString(),
                  "age": int.parse(_age.text),
                });
                await _db.addcoach(coach);

                final snackBar = SnackBar(
                  content: AwesomeSnackbarContent(
                    title: 'Success',
                    message: 'Successfully Created a coach',
                    contentType: ContentType.success,
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              } catch (e) {
                final snackBar = SnackBar(
                  content: AwesomeSnackbarContent(
                    title: 'failure',
                    message: 'Something went wrong',
                    contentType: ContentType.failure,
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }

              // print(response);

              Navigator.pop(context);
            }))
      ],
    );
  }
}
