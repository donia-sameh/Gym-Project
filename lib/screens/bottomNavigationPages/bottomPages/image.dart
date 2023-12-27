import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "package:path/path.dart" as p;
import 'package:phone_auth/shared/customWidgets/Custom_buttom.dart';

class GymProgressApp extends StatefulWidget {
  @override
  _GymProgressAppState createState() => _GymProgressAppState();
}

class _GymProgressAppState extends State<GymProgressApp> {
  List<String> imageUrls = [];
  var greyimage =
      'https://www.google.com/search?q=profile+photo+&tbm=isch&ved=2ahUKEwis27rOz_76AhVFexoKHU2PBGoQ2-cCegQIABAA&oq=profile+photo+&gs_lcp=CgNpbWcQAzIECAAQQzIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEIAEMgUIABCABDoGCAAQBxAeULwEWLwEYKoIaABwAHgAgAGZAYgBkwKSAQMwLjKYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=d4lZY-zDCsX2ac2ektAG&bih=657&biw=1366#imgrc=nfkyptoYx2OzJM';

  Future<void> uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    await Permission.photos.request();
    var permissionStatus = await Permission.photos.status;

    var file = File(pickedFile!.path);

    if (pickedFile != null) {
      var snapshot =
          await _storage.ref().child(p.basename(pickedFile.path)).putFile(file);

      var downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        imageUrls.add(downloadUrl);
      });
    } else {
      Fluttertoast.showToast(msg: 'Grant Permissions and try again');
      return null;
    }
  }

  Future<void> updateImageField(String imageUrl) async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .update({
          'image': imageUrl,
        });
        print('Image field updated successfully.');
      } else {
        print('User not authenticated.');
      }
    } catch (error) {
      print('Error updating image field: $error');
      throw error;
    }
  }

  Future<void> loadImageUrl() async {
    try {
      String? userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userSnapshot.exists) {
          setState(() {
            imageUrls = List<String>.from(userSnapshot.get('images') ?? []);
          });
        } else {
          print('User document does not exist.');
        }
      } else {
        print('User not authenticated.');
      }
    } catch (error) {
      print('Error loading image URLs: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Transformations',
          style: TextStyle(color: Colors.white),
        ),
        leading: CustomButtom(
          buttonIcon: Icon(Icons.chevron_left),
          width: 50,
          pressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/transformation',
              (route) => false,
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 156, 176, 21),
                    ),
                    onPressed: () async {
                      await uploadImage();
                      try {
                        await updateImageField(imageUrls.last);
                        await loadImageUrl();
                      } catch (error) {
                        print('Failed to update image field: $error');
                      }
                    },
                    child: Text('Image Before',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 156, 176, 21),
                    ),
                    onPressed: () async {
                      await uploadImage();
                      try {
                        await updateImageField(imageUrls.last);
                        await loadImageUrl();
                      } catch (error) {
                        print('Failed to update image field: $error');
                      }
                    },
                    child: Text('Image After',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: imageUrls.map((url) {
                return Expanded(
                  child: Image.network(
                    url,
                    width: 200,
                    height: 200,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
