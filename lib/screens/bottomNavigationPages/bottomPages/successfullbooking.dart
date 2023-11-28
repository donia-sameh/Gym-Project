import 'package:flutter/material.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/homescreen.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/profilePage.dart';
import 'package:gym_project/shared/customWidgets/Custom_buttom.dart';

class Successfull_page extends StatelessWidget {
  Successfull_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /* as here works as a casting and giving the varuable a type */
    final Map args = ModalRoute.of(context)?.settings.arguments as Map;
    print(args);
    return Scaffold(
        backgroundColor: Color(0xff0D0D0D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          args['className'],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Finshied",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 300,
                        ),
                        Text(
                          "You Are Successfuly",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Schedule This Class",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 230,
                        ),
                        CustomButtom(
                          text: 'Return To The Main Menu',
                          width: MediaQuery.of(context).size.width,
                          pressed: () {
                            /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            ); */
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/home',
                              (route) => false,
                            );
                          },
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
