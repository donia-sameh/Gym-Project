import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_auth/controllers/auth_service.dart';
import 'package:phone_auth/firebase_options.dart';
import 'package:phone_auth/screens/AgeScreen/age_screen.dart';
import 'package:phone_auth/screens/SignupScreen/signup_screen.dart';
import 'package:phone_auth/screens/activityScreen/activity_screen.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/classInfo.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/coachInfo.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/image.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/successfullbooking.dart';
import 'package:phone_auth/screens/bottomNavigationPages/bottomPages/transformation.dart';
import 'package:phone_auth/screens/bottomNavigationPages/navbar.dart';
import 'package:phone_auth/screens/goalScreen/goal_screen.dart';
import 'package:phone_auth/screens/heightScreen/height_screen.dart';
import 'package:phone_auth/screens/loginscreen/LoginPageEmail.dart';
import 'package:phone_auth/screens/videoup/video.dart';
import 'package:phone_auth/screens/weightScreen/weight_screen.dart';
//import 'package:phone_auth/screens/genderScreen/gender_screen.dart';
import 'package:phone_auth/screens/loginscreen/login_screen.dart';
import 'package:phone_auth/screens/admin_screen/admin_screens.dart';
import 'package:phone_auth/screens/splashScreen/splash_screen.dart';

//import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ProviderScope(
      child: const CheckUserLoggedInOrNot(),
    ),);
}

class CheckUserLoggedInOrNot extends StatefulWidget {
  const CheckUserLoggedInOrNot({super.key});

  @override
  State<CheckUserLoggedInOrNot> createState() => _CheckUserLoggedInOrNotState();
}

class _CheckUserLoggedInOrNotState extends State<CheckUserLoggedInOrNot> {
  @override
  void initState() {
    AuthService.isLoggedIn().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AgeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginSignupPage()));
      }
    });
    super.initState();
  }
  
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
        '/login': (context) => LoginSignupPage(),
        '/age':(context) => AgeScreen(),
        '/weight':(context) => WeightWidget(),
        '/height':(context) => HeightWidget(),
        '/goal':(context) => GoalWidget(),
        '/activity':(context) => ActivityLevelWidget(),
        '/home': (context) => BottomPages(),
        '/image':(context) => GymProgressApp(),
        '/transformation':(context) => TransformationPage(),
        '/home/classInfo': (context) => ClassInfo(),
        '/home/coachInfo': (context) => CoachInfo(),
        '/home/classInfo/success': (context) => Successfull_page(),
        '/admin': (context) => AdminScreens(),
      },
    );
  }
}