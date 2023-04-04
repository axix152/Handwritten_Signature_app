import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeUserData(
      String email,
      String password,
      String name,
      String phoneNumber,
      UserCredential userCredential,
      String filename,
      String fileUrl) async {
    try {
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'phone': phoneNumber,
        'password': password,
        'fileurl': fileUrl,
        'filename': filename,
      });
    } catch (e) {
      print(e);
    }
  }

  Future SavingFile(String fileUrl, String fileName, String id) async {
    return await _firestore.collection('users').doc(id).update({
      'fileurl': fileUrl,
      'filename': fileName,
    });
  }

  Stream getUser() {
    return _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

//  To read a single user document

  Future<Map<String, dynamic>?> getSingleUserData(String userId) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userId).get();
      if (snapshot.exists) {
        return snapshot.data() as Map<String, dynamic>?;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //To read all user documents in the collection

  Future<List<Map<String, dynamic>>> getAllUserData() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      List<Map<String, dynamic>> users = [];
      for (DocumentSnapshot document in snapshot.docs) {
        users.add(document.data() as Map<String, dynamic>);
      }
      return users;
    } catch (e) {
      print(e);
      return [];
    }
  }

  // To update a user document

  Future<void> updateUserData(
      String userId, String name, String phoneNumber) async {
    try {
      await _firestore.collection('users').doc(userId).update({
        'name': name,
        'phoneNumber': phoneNumber,
      });
    } catch (e) {
      print(e);
    }
  }

  // To delete a user document,

  Future<void> deleteUserData(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      print(e);
    }
  }
}
