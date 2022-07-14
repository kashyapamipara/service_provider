import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:service_provider/container.dart';

class AdminList extends StatefulWidget {
  // const AdminList({Key key}) : super(key: key);
  final admin_id;
  AdminList(this.admin_id);
  @override
  _AdminListState createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('admin_details_items')
              .where('admin_details_items_key', isEqualTo: widget.admin_id.toString())
              .snapshots(),
          builder: (context, snapshot) {
            print(widget.admin_id);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:EdgeInsets.all(20),
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

                        ],
                      ),

                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
