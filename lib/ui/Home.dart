import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './SignIn.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  const Home({Key key, this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState(user);
}

class HomeState extends State<Home> {
  FirebaseUser user;
  HomeState(this.user);
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Container(
          child: StreamBuilder<DocumentSnapshot>(
            stream: Firestore.instance
                .collection('users')
                .document('${user.uid}')
                .snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return new Text('Error: ${snapshot.error}');
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Text(snapshot.data['name']),
                        Text(snapshot.data['job']),
                        RaisedButton(
                          child: Text("SignOut"),
                          onPressed: () {
                            _logOut();
                          },
                        )
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> currentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    debugPrint(user.uid);
    return user.uid;
  }

  _logOut() async {
    await auth.signOut().then((_) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }
}
