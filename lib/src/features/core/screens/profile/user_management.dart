import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:signature_forgery_detection/src/utils/background.dart';

class User {
  final String name;
  final String email;
  final String phone;

  User({
    required this.name,
    required this.email,
    required this.phone,
  });
}

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  late Stream<QuerySnapshot> _usersStream;

  @override
  void initState() {
    super.initState();
    _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            LineAwesomeIcons.angle_left,
            color: Colors.white,
          ),
        ),
        title: Text(
          "User Management",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF2A5298),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                LineAwesomeIcons.moon,
                color: Colors.white,
              ))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return BackgroundApp(
              child: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final users = snapshot.data!.docs.map((doc) {
            try {
              return User(
                name: doc['name'],
                email: doc['email'],
                phone: doc['phone'],
              );
            } catch (e) {
              print('Error reading document: $e');
              return null;
            }
          }).where((user) => user != null).toList();

          return BackgroundApp(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final user = users[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(100)
                  ),
                  child: ListTile(
                    leading: Icon(Icons.person,color: Colors.white,),
                    title: Text(user!.name,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user.email.trim(),style: TextStyle(color: Colors.white),),
                        Text(user.phone.trim(),style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    onTap: () {
                      // Handle tapping on user
                      print("Tapped on user ${user.name}");
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
