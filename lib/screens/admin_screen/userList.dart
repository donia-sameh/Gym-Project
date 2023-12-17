import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserListPage extends StatelessWidget {
  const UserListPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List Page'),
      ),
      body: FutureBuilder(
        future: getUsersFromFirestore(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<Map<String, dynamic>> users =
                  snapshot.data as List<Map<String, dynamic>>;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index]['email']),
                  );
                },
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getUsersFromFirestore() async {
    try {
      QuerySnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      List<Map<String, dynamic>> users = [];
      userSnapshot.docs.forEach((doc) {
        users.add(doc.data() as Map<String, dynamic>);
      });
      return users;
    } catch (error) {
      print('Error getting users data: $error');
      throw error;
    }
  }
}
