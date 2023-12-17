import 'package:gym_project/services/databaseService.dart';


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
