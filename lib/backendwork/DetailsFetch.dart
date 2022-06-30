import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rider/LoginPages/signUp_page.dart';
import 'package:rider/mainPage/mainpage.dart';
import 'package:rider/LoginPages/login_Page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginState extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<LoginState> with AfterLayoutMixin<LoginState> {

  FirebaseAuth auth = FirebaseAuth.instance;

  String srm="";
  final _database=FirebaseDatabase.instance.ref();
  int c=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeListeners();
  }
  void activeListeners(){
    final User? user=auth.currentUser;
    final id=user?.uid ;
    _database.child('ONLINE/').onValue.listen((event) {
      final Object? description=event.snapshot.value ?? false;
      setState(() {
        print('DescriptionLS=$description');
        srm='$description';
        print('SRMx1=$srm');

        if(srm.compareTo('false')==0) {
          c++;
        }




      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(body: new Container(color: Colors.white));
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // Calling the same function "after layout" to resolve the issue.

    activeListeners();
  }



  }
