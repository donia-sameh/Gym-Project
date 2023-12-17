import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:GymmProjectt/Model/user.dart';
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user;
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await _firestore.collection('users').doc(result.user!.uid).set({
        'email': email,
      });
      return user;
    } catch (error) {
      print('Error registering: $error');
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
// Future<Userr?> getUserDataFromFirestore(String userId) async {
// try {
// DocumentSnapshot userDoc =
// await _firestore.collection('users').doc(userId).get();
// if (userDoc.exists) {
// return Userr(uid: userId, email: userDoc['email']);
// }
// return null;
// } catch (error) {
// print('Error getting user data: $error');
// return null;
// }
// }
}
