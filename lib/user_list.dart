import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service_provider/intro.dart';
import 'package:service_provider/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
class UserList extends StatefulWidget {



  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
var search_item;
int container_index=1;
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
        ],
        title: Text('All Services'),
      ),

      backgroundColor: Colors.white,
      body:
       Column(

          children:[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
              child: TextFormField(
                key: ValueKey('searched item'),
                onChanged: (value) {
                  setState(() {
                    search_item = value;
                    if (search_item.isNotEmpty && search_item != null)
                      container_index = 6;
                    else
                      container_index = 1;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.network(
                      "https://cdn-icons-png.flaticon.com/128/49/49116.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.fill,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Enter service you want to search',
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: container_index==1?FirebaseFirestore.instance
                      .collection('admin_details_items')

                      .snapshots():FirebaseFirestore.instance
                      .collection("admin_details_items")

                      .where('name',
                      isGreaterThanOrEqualTo: search_item)
                      .where('name',
                      isLessThan: search_item + 'z').snapshots(),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(

                              decoration: BoxDecoration(color: Colors.grey,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 290,

                              width: 400,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(snapshot.data.docs[index]['name'] , style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(height: 20,),


                                  Container(
                                    decoration: BoxDecoration(color: Colors.deepOrange,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(fit: BoxFit.fill,image:NetworkImage(snapshot.data.docs[index]['image'] ),
                                      ),
                                    ),

                                    height: 150,
                                    width: 400,
                                  ),
                                  Text(snapshot.data.docs[index]['des'] , style: TextStyle(color: Colors.white),),
                                  SizedBox(height: 20,),
                                  RaisedButton(onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Profile(snapshot.data.docs[index]['admin_details_items_key'],snapshot.data.docs[index]['image'] ),
                                      ),
                                    );

                                  } , child: Text("Contact Us" , style: TextStyle(),),),
                                ],
                              ),

                            ),
                          );
                        },
                      );
                    }
                  }),
            ),]

      ),

    );
  }
}
