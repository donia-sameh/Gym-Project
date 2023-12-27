import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phone_auth/providers/provider.dart';
import 'package:phone_auth/shared/styles/defaultStyles.dart';

final userProvider = Provider<User?>((ref) {
  return FirebaseAuth.instance.currentUser;
});

final boughtClassesProvider = FutureProvider<List<GymClass>>((ref) async {
  final user = ref.watch(userProvider);

  if (user != null) {
    final snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.email)
        .collection('boughtClasses')
        .get();

    return snapshot.docs.map((doc) => GymClass.fromDocument(doc)).toList();
  }

  return [];
});

class GymClass {
  final String id;
  final String name;
  final bool isBought;

  GymClass({
    required this.id,
    required this.name,
    required this.isBought,
  });

  factory GymClass.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return GymClass(
      id: doc.id,
      name: data['name'] ?? '',
      isBought: data['isBought'] ?? false,
    );
  }
}

class UserProvider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allUsers = ref.watch(allUsersProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Display Users', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/admin',
              (route) => false,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: allUsers.when(
            data: (users) => Column(
              children: [
                Text('All Users: ${users.length}', style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                Table(
                  border: TableBorder.all(color: Colors.white),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('User ID', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Email', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    // Display the list of users if needed
                    for (var userData in users)
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(userData.userId, style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(userData.email, style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          // Display other user-related fields if needed
                        ],
                      ),
                  ],
                ),
              ],
            ),
            loading: () => CircularProgressIndicator(),
            error: (error, stack) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
