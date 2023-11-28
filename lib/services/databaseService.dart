import 'package:gym_project/models/coach.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/Class.dart';
import '../models/user.dart';

class DatabaseService {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialdb();
      return _db;
    } else {
      return _db;
    }
  }

  /* intialdb Function is to intial the database*/
  intialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'gym26.db');
    Database mydb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

/*   Future<void> deleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'gym.db');
    databaseFactory.deleteDatabase(path);
    print("deleted ||" + path);
  } */

  /* onCreate function is to create the database for the first time */
  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE user(
        userId INTEGER NOT NULL PRIMARY KEY,
        email TEXT,
        password TEXT,
        firstName TEXT,
        lastName TEXT,
        address TEXT,
        phoneNumber TEXT ,
        paymentType NUMERIC ,
        age NUMERIC,
        gender TEXT
        ); 
        ''');

    await db.execute('''
        CREATE TABLE class(
        classId INTEGER PRIMARY KEY ,
        classDescription text,
        classLevel NUMERIC,
        className text,
        dateOfClass date,
        estimatedCalories NUMERIC,
        tags text,
        duration NUMERIC,
        startTime Text,
        endTime Text,
        pricePerClass REAL,
        image text
        );  
        ''');

    await db.execute('''
        CREATE TABLE coach(
          coachId INTEGER PRIMARY KEY ,
          email TEXT,
          password TEXT,
          firstName TEXT,
          lastName TEXT,
          phoneNumber TEXT,
          age integer
        );
      ''');

    await db.execute('''
        CREATE TABLE clerk(
          CLERK_ID INTEGER NOT NULL PRIMARY KEY ,
          EMAIL TEXT NOT NULL,
          PASSWORD TEXT NOT NULL,
          PHONENUMBER NUMERIC NOT NULL ,
          FIRST_NAME TEXT NOT NULL,
          LAST_NAME TEXT NOT NULL
        );
      ''');

    await db.execute('''
      CREATE TABLE workoutPlan(
        userId INTEGER NOT NULL,
        WORKOUTPLANID INTEGER AUTO INCREMENT NOT NULL PRIMARY KEY ,
        DISCRIPTION TEXT NOT NULL,
        WORKOUT_DATE NUMERIC NOT NULL ,
        FOREIGN KEY (userId) REFERENCES USER(userId)
      );
    ''');

    print("Database created");
  }

  /* onUpgrade function is to alter the database with a version number */
  _onUpgrade(Database db, int oldversion, int newversion) async {
    print("on upgrade");
  }

  /* ٍSelect statement */
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  /* delete statement */
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  /* update statement */
  updateData(String sql) async {
    /* 
    UPDATE table_name
    SET column1 = value1, column2 = value2...., columnN = valueN
    WHERE [condition];
    */
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  /* insert statement */
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  Future<List> allClasses() async {
    Database? mydb = await db;
    List response = await mydb!.rawQuery("select * from class");
    return response;
  }

  Future<int> addClass(Class class_) async {
    Database? mydb = await db;
    return mydb!.insert('class', class_.toMap());
  }

  Future<List> filterSearch(String keyword) async {
    Database? mydb = await db;
    if (keyword == 'all classes') {
      List response = await mydb!.rawQuery("select * from class");
      return response;
    } else {
      List response =
          await mydb!.rawQuery("select * from class where tags = '$keyword' ");
      return response;
    }
  }

  Future<List> allCoaches() async {
    Database? mydb = await db;
    List response = await mydb!.rawQuery("select * from coach");
    return response;
  }

  Future<int> addcoach(Coach coach) async {
    Database? mydb = await db;
    return mydb!.insert('coach', coach.toMap());
  }

  updateUserData(user) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate('''
      update user
      SET firstName   = '${user.firstName}', 
          lastName    = '${user.lastName}',
          email       = '${user.email}',
          phoneNumber = '${user.phoneNumber}'
      where userId    = ${user.userId};
    ''');
    return response;
  }

  updatePaymentType(String? paymentType, int? userId) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate('''
      update user
      SET paymentType = '$paymentType'
      where userId    = ${userId};
    ''');
    return response;
  }
}
