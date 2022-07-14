// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// class First extends StatefulWidget {
//
//
//   @override
//   _FirstState createState() => _FirstState();
// }
//
// class _FirstState extends State<First> {
//   User loggedinuser;
//
//   FirebaseAuth user;
//   void getCurrentUser() async {
//     try {
//       final user = await _auth.currentUser;
//
//       if (user != null) {
//         loggedinuser = user;
//         print(loggedinuser.email);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }
//   final _auth = FirebaseAuth.instance;
//
//   int count=0;String email,email1;String password,password1;
//   @override
//   Widget build(BuildContext context) {
//     return count==0?Center(
//       child: Container(
//
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.email_outlined,
//               size: 150,
//             ),
//
//             Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 3,
//                   ),
//                 ),
//                 child:Column(
//                   children: [
//                     FlatButton(
//                         onPressed: () {
//                           setState(() {
//                             count=1;
//                           });
//
//                         },
//
//                         child: Text(
//                           'Register',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                           ),
//                         )
//                     ),
//
//
//                   ],
//                 )
//             ),
//             SizedBox(height: 10,),
//             Container(
//
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(
//                     color: Colors.black,
//                     width: 3,
//                   ),
//                 ),
//                 child:Column(
//                   children: [
//                     FlatButton(
//
//                         onPressed: () {
//                           setState(() {
//                             count=2;
//                           });
//
//
//                         },
//
//                         child: Text(
//                           '  LogIn  ',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 25,
//                           ),
//                         )
//                     ),
//
//                   ],
//                 )
//             )
//           ],
//         ),
//         height: 450,
//         width: 300,
//         decoration: BoxDecoration(
//           color: Colors.tealAccent,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.8),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 3), // changes position of shadow
//             ),
//           ],
//
//
//           borderRadius: BorderRadius.circular(25),
//           border: Border.all(
//             color: Colors.black,
//             width: 5,
//           ),
//         ),
//       ),
//     ):
//
//     count==1?
//     Center(
//       child: SingleChildScrollView(
//         child: Center(
//           child: Container(
//
//
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.only(bottom: 30.0),
//                         child: FlatButton(
//                           onPressed: () {
//                             setState(() {
//                               count=0;
//                             });
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             size: 50,
//                           ),
//                         )),
//                   ],
//                 ),
//                 Icon(
//                   Icons.file_copy_outlined,
//                   size: 150,
//                 ),
//                 SizedBox(height: 10.0,),
//                 Text(
//                   'Enter Your Email And Password... ',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: TextField(
//
//                     onChanged: (String value) {
//                       email = value;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       hintText: 'xyz@gmail.com',
//                       contentPadding: EdgeInsets.all(8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: TextField(
//
//                     onChanged: (String value) {
//                       password = value;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       hintText: 'Password',
//                       contentPadding: EdgeInsets.all(8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 SizedBox(height: 10.0,),
//                 Container(
//
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 3,
//                       ),
//                     ),
//                     child:Column(
//                       children: [
//                         FlatButton(
//
//                             onPressed: ()async {
//                               final newUser = await _auth.createUserWithEmailAndPassword(
//                                   email: email, password: password);
//                             },
//
//                             child: Text(
//                               '  Register  ',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                               ),
//                             )
//                         ),
//
//                       ],
//                     )
//                 )
//               ],
//             ),
//             height: 450,
//             width: 300,
//             decoration: BoxDecoration(
//               color: Colors.tealAccent,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.8),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//
//
//               borderRadius: BorderRadius.circular(25),
//               border: Border.all(
//                 color: Colors.black,
//                 width: 5,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ):
//     Center(
//       child: SingleChildScrollView(
//         child: Center(
//
//
//           child: Container(
//
//
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                         padding: EdgeInsets.only(bottom: 30.0),
//                         child: FlatButton(
//                           onPressed: () {
//                             setState(() {
//                               count=0;
//                             });
//                           },
//                           child: Icon(
//                             Icons.arrow_back,
//                             size: 50,
//                           ),
//                         )),
//                   ],
//                 ),
//                 Icon(
//                   Icons.login,
//                   size: 150,
//                 ),
//                 SizedBox(height: 10.0,),
//                 Text(
//                   'Enter Your Email And Password... ',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: TextField(
//
//                     onChanged: (String value) {
//                       email1 = value;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       hintText: 'xyz@gmail.com',
//                       contentPadding: EdgeInsets.all(8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 20, right: 20),
//                   child: TextField(
//
//                     onChanged: (String value) {
//                       password1 = value;
//                     },
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       hintText: 'Password',
//                       contentPadding: EdgeInsets.all(8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10,),
//                 SizedBox(height: 10.0,),
//                 Container(
//
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                         color: Colors.black,
//                         width: 3,
//                       ),
//                     ),
//                     child:Column(
//                       children: [
//                         FlatButton(
//
//                             onPressed: () async {
//                               final user = await _auth.signInWithEmailAndPassword(
//                                   email: email, password: password);
//                               if (user != null) {
//                                 print('success');
//                               }
//
//                             },
//
//                             child: Text(
//                               '  LogIn  ',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 25,
//                               ),
//                             )
//                         ),
//
//                       ],
//                     )
//                 )
//               ],
//             ),
//             height: 450,
//             width: 300,
//             decoration: BoxDecoration(
//               color: Colors.tealAccent,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.8),
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//
//
//               borderRadius: BorderRadius.circular(25),
//               border: Border.all(
//                 color: Colors.black,
//                 width: 5,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
