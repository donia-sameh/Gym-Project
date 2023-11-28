import 'package:gym_project/services/databaseService.dart';
import 'package:sqflite/sqflite.dart';

class Globals {
  static int? userId;
  DatabaseService _db = DatabaseService();

  static addUserId(int id) {
    userId = id;
  }

  static int? getUserId() {
    return userId;
  }
}
