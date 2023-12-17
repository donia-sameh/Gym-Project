import 'package:flutter/material.dart';
import 'package:gym_project/screens/AgeScreen/age_screen.dart';
import 'package:gym_project/screens/SignupScreen/signup_screen.dart';
import 'package:gym_project/screens/activityScreen/activity_screen.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/classInfo.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/coachInfo.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/successfullbooking.dart';
import 'package:gym_project/screens/bottomNavigationPages/navbar.dart';
import 'package:gym_project/screens/goalScreen/goal_screen.dart';
import 'package:gym_project/screens/heightScreen/height_screen.dart';
import 'package:gym_project/screens/videoup/video.dart';
import 'package:gym_project/screens/weightScreen/weight_screen.dart';
//import 'package:gym_project/screens/genderScreen/gender_screen.dart';
import 'package:gym_project/screens/loginscreen/login_screen.dart';
import 'package:gym_project/screens/admin_screen/admin_screens.dart';
import 'package:gym_project/screens/splashScreen/splash_screen.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planet Gym',
      /* home: SplashScreen(), */
      initialRoute: '/splashscreen',
      routes: {
        '/splashscreen': (context) => SplashScreen(),
        '/signup': (context) => Signup(),
        '/login': (context) => Login(),
        '/age':(context) => AgeScreen(),
        '/weight':(context) => WeightWidget(),
        '/height':(context) => HeightWidget(),
        '/goal':(context) => GoalWidget(),
        '/activity':(context) => ActivityLevelWidget(),
        '/home': (context) => BottomPages(),
        //'/video':(context) => VideoPage(),
        '/home/classInfo': (context) => ClassInfo(),
        '/home/coachInfo': (context) => CoachInfo(),
        '/home/classInfo/success': (context) => Successfull_page(),
        '/admin': (context) => AdminScreens(),
      },
    );
  }
}
