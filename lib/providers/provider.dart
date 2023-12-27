import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allUsersProvider = FutureProvider<List<UserData>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('users').get();

  return snapshot.docs.map((doc) => UserData.fromDocument(doc)).toList();
});

class UserData {
  final String userId;
  final String email;
  // Add other user-related fields if needed

  UserData({
    required this.userId,
    required this.email,
    // Add other user-related fields if needed
  });

  factory UserData.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserData(
      userId: doc.id,
      email: data['email'] ?? '',
      // Extract other user-related fields if needed
    );
  }
}

