// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gym_project/models/Class.dart';
import '../../../shared/customWidgets/CustomTextField.dart';
import '../../../services/databaseService.dart';
import '../../../shared/customWidgets/Custom_buttom.dart';
import '../../../shared/styles/defaultStyles.dart';
// import '../../services/databaseService.dart';

class CreateClass extends StatefulWidget {
  const CreateClass({super.key});

  @override
  State<CreateClass> createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  DatabaseService _db = DatabaseService();

  TextEditingController _classNameController = TextEditingController();
  TextEditingController _classLevelController = TextEditingController();
  TextEditingController _classDescreptionController = TextEditingController();
  TextEditingController _classTagsController = TextEditingController();
  TextEditingController _pricePerclassController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _etimatedCaloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        'Create New Class',
        style: titleStyle.copyWith(
          color: Colors.black,
        ),
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
                    name: 'class name',
                    width: 123,
                    obscureText: false,
                    hintText: 'cardio',
                    colortext: Colors.black,
                    controller: _classNameController,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    name: 'class Level',
                    width: 123,
                    obscureText: false,
                    hintText: '1,2 OR 3',
                    colortext: Colors.black,
                    controller: _classLevelController,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                name: 'class description',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: 'write about shape that want to be...',
                colortext: Colors.black,
                controller: _classDescreptionController,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTextField(
                    name: 'class tags',
                    width: 123,
                    obscureText: false,
                    hintText: 'fitness,workout....',
                    colortext: Colors.black,
                    controller: _classTagsController,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    name: 'price Per Class',
                    width: 123,
                    obscureText: false,
                    hintText: '3 \$ ',
                    colortext: Colors.black,
                    controller: _pricePerclassController,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTextField(
                    name: 'Start Time ',
                    width: 123,
                    obscureText: false,
                    hintText: '1/1/2023',
                    colortext: Colors.black,
                    controller: _startTimeController,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    name: 'End Time',
                    width: 123,
                    obscureText: false,
                    hintText: '2/1/2023',
                    colortext: Colors.black,
                    controller: _endTimeController,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTextField(
                    name: 'Duration',
                    width: 123,
                    obscureText: false,
                    hintText: '45 min',
                    colortext: Colors.black,
                    controller: _durationController,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    name: 'Estimated calories',
                    width: 123,
                    obscureText: false,
                    hintText: '300 cal/class',
                    colortext: Colors.black,
                    controller: _etimatedCaloriesController,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        CustomButtom(
          text: 'create class',
          width: MediaQuery.of(context).size.width,
          pressed: () async {
            try {
              Class class_ = Class({
                'classDescription': _classDescreptionController.text.trim(),
                'classLevel': int.parse(_classLevelController.text.trim()),
                'className': _classNameController.text.trim(),
                'dateOfClass': "1/8/2022",
                'estimatedCalories':
                    int.parse(_etimatedCaloriesController.text.trim()),
                'duration': int.parse(_durationController.text.trim()),
                'tags': _classTagsController.text.trim(),
                'startTime': _startTimeController.text.trim().toString(),
                'endTime': _endTimeController.text.trim().toString(),
                'pricePerClass':
                    double.parse(_pricePerclassController.text.trim()),
              });
              await _db.addClass(class_);

              final snackBar = SnackBar(
                content: AwesomeSnackbarContent(
                  title: 'success',
                  message: 'succesfully created a class',
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
                  message: 'Some of the values is null',
                  contentType: ContentType.failure,
                ),
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }

            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
