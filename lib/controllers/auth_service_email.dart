import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

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
      String email, String password, String fname, String lname) async {
    try {
      UserCredential result =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      await _firestore.collection('users').doc(result.user!.uid).set({
        'email': email,
        'fname': fname,
        'lname': lname,
        'age': 0,
        'weight': 0,
        'height': 0,
        'goal': "",
        'activity': "",
        'image': "",
      });
      return user;
    } catch (error) {
      print('Error registering: $error');
      return null;
    }
  }
  Future<String?> ageEntered(int age) async {
    try {
      String? user = FirebaseAuth.instance.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'age': age,
      });
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<String?> weightEntered(int weight) async {
    try {
      String? user = FirebaseAuth.instance.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'weight': weight,
      });
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<String?> heightEntered(int height) async {
    try {
      String? user = FirebaseAuth.instance.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'height': height,
      });
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<String?> goalEntered(String goal) async {
    try {
      String? user = FirebaseAuth.instance.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'goal': goal,
      });
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  Future<String?> activityEntered(String activity) async {
    try {
      String? user = FirebaseAuth.instance.currentUser!.uid;
      await _firestore.collection('users').doc(user).update({
        'activity': activity,
      });
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }


    // Future<User?> getCurrentUser() async {
  //   return _auth.currentUser;
  // }

  // Future<String?> getUserFirstName() async {
  //   try {
  //     User? user = await getCurrentUser();
  //     return user?.displayName;
  //   } catch (e) {
  //     print("Error getting user first name: $e");
  //     return null;
  //   }
  // }
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

// void imageClassEntered(String? imagePath) async {
//   try {
//     String? user = FirebaseAuth.instance.currentUser!.uid;
//     String imagePath = "/path/to/your/saved/image.jpg"; // Replace with the actual image path
// imageClassEntered(imagePath);

//     if (imagePath != null) {
//       // Update the 'image' field in Firestore with the image path
//       await _firestore.collection('users').doc(user).update({
//         'image': imagePath,
//       });

//     } else {
//       return null; // Return null if the image path is null
//     }
//   } catch (error) {
//     print('Error updating image: $error');
//     return null;
//   }
// }
  // Future<void> updateImageField(String imageUrl) async {
  //   try {
  //     String? userId = FirebaseAuth.instance.currentUser?.uid;
  //     if (userId != null) {
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(userId)
  //           .update({
  //         'image': imageUrl,
  //       });
  //       print('Image field updated successfully.');
  //     } else {
  //       print('User not authenticated.');
  //     }
  //   } catch (error) {
  //     print('Error updating image field: $error');
  //     // Handle the error or throw it to be handled at a higher level
  //     throw error;
  //   }
  // }
}
