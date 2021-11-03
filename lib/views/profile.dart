import 'package:flutter/material.dart';
import 'package:shipping/services/auth.dart';
import 'package:shipping/views/signin.dart';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String myProfilePic = FirebaseAuth.instance.currentUser!.photoURL.toString();
  String myName = FirebaseAuth.instance.currentUser!.displayName.toString();
  String myEmail = FirebaseAuth.instance.currentUser!.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Card(
                  child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(myProfilePic),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        onTap: () {},
                        title: Text(myName),
                        subtitle: Text(myEmail),
                        // leading: Icon(
                        //   Icons.add_business_rounded,
                        //   size: 40,
                        // ),
                        // trailing: Icon(Icons.arrow_forward_ios_outlined)
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                AuthMethods().signOut().then((s) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                child: Text("Sign Out"),
              )),
        ],
      ),
    );
  }
}
