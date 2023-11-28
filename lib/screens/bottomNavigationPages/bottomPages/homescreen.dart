import 'package:flutter/material.dart';
import 'package:gym_project/models/Class.dart';
import 'package:gym_project/services/databaseService.dart';
import 'package:gym_project/shared/coach_card.dart';
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
                userName: "User",
                description: "have a nice Day In Our App",
              ),
              const SizedBox(height: 40),
              Text(
                "Classes This Week",
                style: titleStyle.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 15),
              Container(
                  height: 270,
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
              const SizedBox(height: 15),
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
                height: 270,
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
