import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import '../../../shared/customWidgets/CustomTextField.dart';
import '../../../shared/customWidgets/Custom_buttom.dart';
import '../../../services/databaseService.dart';
import '../../../shared/styles/defaultStyles.dart';

class DeleteClass extends StatefulWidget {
  const DeleteClass({super.key});

  @override
  State<DeleteClass> createState() => _DeleteClassState();
}

class _DeleteClassState extends State<DeleteClass> {
  DatabaseService _db = DatabaseService();
  TextEditingController _classIdcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        'Delete Class ',
        style: titleStyle.copyWith(color: Colors.black),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Container(
          height: 80,
          child: Column(
            children: [
              CustomTextField(
                name: 'class id ',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '9856',
                colortext: Colors.black,
                controller: _classIdcontroller,
              ),
            ],
          ),
        ),
      ),
      actions: [
        CustomButtom(
            text: 'delete',
            width: MediaQuery.of(context).size.width,
            pressed: () async {
              try {
                var response = await _db.deleteData('''
              delete from class where class_id = ${_classIdcontroller.text}
            ''');
                if (response == 0) {
                  final snackBar = SnackBar(
                    content: AwesomeSnackbarContent(
                      title: 'My bad',
                      message: 'Did not find a class with this id',
                      contentType: ContentType.failure,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                } else {
                  final snackBar = SnackBar(
                    content: AwesomeSnackbarContent(
                      title: 'Success',
                      message: 'Successfully deleted the class',
                      contentType: ContentType.success,
                    ),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(snackBar);
                }
              } catch (e) {
                final snackBar = SnackBar(
                  content: AwesomeSnackbarContent(
                    title: 'failure',
                    message: 'some of the values is null',
                    contentType: ContentType.failure,
                  ),
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
              Navigator.pop(context);
            })
      ],
    );
  }
}
