import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/allClasses.dart';
import 'package:gym_project/screens/bottomNavigationPages/bottomPages/profilePage.dart';
import '../../../shared/styles/defaultStyles.dart';

import '../../shared/class_card.dart';
import '../../shared/customWidgets/custom_app_bar.dart';
import 'bottomPages/homescreen.dart';

class BottomPages extends StatefulWidget {
  const BottomPages({super.key});

  @override
  State<BottomPages> createState() => _BottomPagesState();
}

class _BottomPagesState extends State<BottomPages> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print(_selectedIndex);
  }

  List<Widget> screens = [
    HomeScreen(),
    AllClassesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: crblack800,
      body: screens[_selectedIndex],
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 156, 176, 21),
        gap: 10,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
        padding: EdgeInsets.all(20),
        tabMargin: EdgeInsets.all(1),
        onTabChange: _onItemTapped,
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.class_rounded,
            text: "Classes",
          ),
          GButton(
            icon: Icons.people,
            text: "profile",
          ),
        ],
      ),
      /*  bottomNavigationBar: BottomNavigationBar(
        backgroundColor: blue800,
        unselectedItemColor: Colors.white,
        // selectedIconTheme: ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_outlined),
            label: 'Classes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
      ), */
    );
  }
}
