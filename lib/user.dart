import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {

  String firstname;

  @override
  void initState() {

    super.initState();
    getdata();
  }

  getdata() async{

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
     firstname = pref.getString('firstname');
     print('Shared Preferance: $firstname');
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text('First name is: $firstname'),

              FlatButton(onPressed: (){

                getdata();

              },
                  child: Text("Submit")
              )
            ],
          ),


        ],
      ),

    );
  }
}

