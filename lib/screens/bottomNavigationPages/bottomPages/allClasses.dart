import 'package:flutter/material.dart';
import 'package:gym_project/models/Class.dart';
import 'package:gym_project/services/databaseService.dart';
import 'package:gym_project/shared/class_card.dart';
import '../../../shared/styles/defaultStyles.dart';

class AllClassesPage extends StatefulWidget {
  const AllClassesPage({super.key});

  @override
  State<AllClassesPage> createState() => _AllClassesPageState();
}

class _AllClassesPageState extends State<AllClassesPage> {
  DatabaseService _db = DatabaseService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "All Classes",
                style: titleStyle,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: _db.allClasses(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 20,
                        ),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          Class class_ = Class.fromMap(snapshot.data![index]);
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/home/classInfo',
                                arguments: class_,
                              );
                            },
                            child: ClassCard(
                              width: 180,
                              height: 170,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
