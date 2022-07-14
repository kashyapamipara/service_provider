import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:service_provider/additem.dart';
import 'package:service_provider/admin_list.dart';
import 'package:service_provider/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';

class First extends StatefulWidget {
  final admin_id;First(this.admin_id);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Intro()));
            },
            child: Container(
              height: 40,
              width: 40,
              child: Icon(Icons.logout),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage("https://cdn-icons-png.flaticon.com/128/1574/1574351.png"),
              //     fit: BoxFit.contain,
              //   ),
              //   shape: BoxShape.rectangle,
              // ),
            ),
          ),
        ],title: Text('Provider',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
      body: index == 0 ? AdminList(widget.admin_id) : Add(widget.admin_id),
      bottomNavigationBar: FancyBottomNavigation(
        // barBackgroundColor: Colors.orange[200],
        initialSelection: index,
        tabs: [
          TabData(iconData: Icons.list, title: "Service List"),
          TabData(iconData: Icons.add_circle_rounded, title: "Add Service"),
          // TabData(iconData: Icons.perm_identity_outlined, title: "Profile"),
        ],
        circleColor: Colors.yellow[700],
        inactiveIconColor: Colors.yellow[700],
        onTabChangedListener: (position) {
          setState(() {
            index = position;
          });
        },
      ),
    );
  }
}
