import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/models/Class.dart';
import 'package:phone_auth/screens/videoup/video.dart';
import 'package:phone_auth/services/databaseService.dart';
import 'package:phone_auth/shared/coach_card.dart';
import '../../../models/coach.dart';
import '../../../shared/class_card.dart';
import '../../../shared/customWidgets/Custom_tab_bar.dart';
import '../../../shared/customWidgets/custom_app_bar.dart';
import '../../../shared/styles/defaultStyles.dart';
import 'classInfo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseService _db = DatabaseService();
  String keyword = 'all classes';

@override
  void initState() {
    super.initState();
   // _user = FirebaseAuth.instance.currentUser;
   
    // Fetch user data on page load
    _fetchUserData();
  }
  String _userName='';
 Future<void> _fetchUserData() async {
    if (FirebaseAuth.instance.currentUser!.uid != null) {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get();

      setState(() {
        _userName = userSnapshot['fname'] ?? '';
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                userName: _userName,
                description: "Welcome to our gym",
              ),
              const SizedBox(height: 40),
              Text(
                "Classes This Week",
                style: titleStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 15),
              Container(
                  height: 300,
                  child: FutureBuilder(
                    future: _db.allClasses(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 20),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            Class class_ = Class.fromMap(snapshot.data![index]);
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/home/classInfo',
                                    arguments: class_);
                              },
                              child: ClassCard(
                                className: class_.className,
                                calories: class_.estimatedCalories,
                                duration: class_.duration,
                                img: "assets/girl-box.png",
                                level: class_.classLevel,
                              ),
                            );
                          },
                        );
                      }
                    },
                  )),
                  const SizedBox(height: 30),
              //     Text(
              //   "Training Videos",
              //   style: titleStyle.copyWith(fontSize: 25),
              // ),
              // Container(
              //     height: 216,
              //     child: VideoPage(),
              //     ),
              // const SizedBox(height: 15),
              Text(
                "Classes By Category",
                style: titleStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomTabBar(
                        classTag: "All Classes",
                        pressed: () async {
                          setState(() {
                            keyword = 'all classes';
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTabBar(
                        classTag: "Full body",
                        pressed: () async {
                          setState(() {
                            keyword = 'full body';
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTabBar(
                        classTag: "Yoga",
                        pressed: () async {
                          setState(() {
                            keyword = 'yoga';
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTabBar(
                      classTag: "Functional",
                      pressed: () {
                        setState(() {
                          keyword = 'functional';
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomTabBar(
                        classTag: "cardio",
                        pressed: () async {
                          setState(() {
                            keyword = 'cardio';
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 300,
                child: FutureBuilder(
                  future: _db.filterSearch(keyword),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Class class_ = Class.fromMap(snapshot.data![index]);
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/home/classInfo',
                                  arguments: class_);
                            },
                            child: ClassCard(
                              className: class_.className,
                              calories: class_.estimatedCalories,
                              duration: class_.duration,
                              img: "assets/girl-box.png",
                              level: class_.classLevel,
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ),
              Text(
                "Coaches",
                style: titleStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 15),
              Container(
                height: 270,
                child: FutureBuilder(
                  future: _db.allCoaches(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 20),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Coach coach = Coach.fromMap(snapshot.data![index]);
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/home/coachInfo',
                                  arguments: coach);
                            },
                            child: CoachCard(
                              coachName: coach.firstName,
                              img: "assets/coach-girl.png",
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}