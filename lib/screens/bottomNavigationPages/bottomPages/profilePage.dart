import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/shared/customWidgets/customTextField.dart';
import 'package:phone_auth/shared/customWidgets/custom_Buttom.dart';
import 'package:phone_auth/services/databaseService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final DatabaseService _db = DatabaseService();
  String _user = FirebaseAuth.instance.currentUser!.uid;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  // late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    // _user = FirebaseAuth.instance.currentUser;
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    // _phoneNumberController = TextEditingController();

    // Fetch user data on page load
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (_user != null) {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(_user).get();

      setState(() {
        _firstNameController.text = userSnapshot['fname'] ?? '';
        _lastNameController.text = userSnapshot['lname'] ?? '';
        _emailController.text = userSnapshot['email'] ?? '';
        // _phoneNumberController.text = userSnapshot['mobile'] ?? '';
      });
    }
  }

  Future<dynamic> updateUserDetails(
      String firstname, String lastname, String useraddress) async {
    try {
      final updateUser = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid);
      updateUser.update(
        {
          'fname': firstname.trim(),
          'lname': lastname.trim(),
          // 'mobile': userPhoneNumber.trim(),
          'address': useraddress.trim(),
        },
      );

      print('USER UPDATED');
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Settings",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 0),
              Container(
                margin: const EdgeInsets.fromLTRB(55, 40, 50, 10),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // Use a placeholder image or fetch user's image from Firestore Storage
                  image: DecorationImage(
                    image: AssetImage("assets/planetLogo.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 15),
              CustomTextField(
                name: 'First Name',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '',
                controller: _firstNameController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                name: 'Last Name',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '',
                controller: _lastNameController,
              ),
              SizedBox(height: 15),
              CustomTextField(
                name: 'Email',
                width: MediaQuery.of(context).size.width,
                obscureText: false,
                hintText: '',
                controller: _emailController,
              ),
              SizedBox(height: 15),
              // CustomTextField(
              //   name: 'Phone Number',
              //   width: MediaQuery.of(context).size.width,
              //   obscureText: false,
              //   hintText: '',
              //   controller: _phoneNumberController,
              // ),
              SizedBox(height: 35),
              CustomButtom(
                  text: 'Save Changes',
                  width: MediaQuery.of(context).size.width,
                  pressed: () async {
                    updateUserDetails(_firstNameController.text,
                        _lastNameController.text, _emailController.text);
                    final snackBar = SnackBar(
                      content: AwesomeSnackbarContent(
                        title: 'Success',
                        message: 'User Updated',
                        contentType: ContentType.success,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    // _phoneNumberController.text);
                  }),
              SizedBox(height: 20),
              CustomButtom(
                text: 'Sign Out',
                width: MediaQuery.of(context).size.width,
                pressed: () async {
                  // Sign out the user
                  await FirebaseAuth.instance.signOut();
                  // Navigate to the login screen
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
