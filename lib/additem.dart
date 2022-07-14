import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  final admin_id;
  Add(this.admin_id);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  var _userEmail = '';
  bool inProcess = false;

  String search_item = '';
  int container_index = 1;

  String name;
  double price;
  String type = "Starter";
  String veg = "veg";
  File _image;
  var img_path;
  int status = 2;
  bool expanded = true;
  var allData;
  bool loading = false;
  int gender = 1;
  bool isVeg = true;
  bool isoffline = false;
  var des = '';
  final _formKey = GlobalKey<FormState>();
  Future<String> uploadFile(File image) async {
    String downloadURL;
    String postId = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref =
        FirebaseStorage.instance.ref().child("images").child("$_userEmail.jpg");
    await ref.putFile(image);
    downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  void selectImageFromCamera() async {
    final picker = ImagePicker();
    setState(() {
      inProcess = true;
    });
    final imageFile =
        await picker.getImage(source: ImageSource.camera, imageQuality: 50);

    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
      });
    }
    setState(() {
      inProcess = false;
    });
  }

  void selectImageFromGallery() async {
    final picker = ImagePicker();
    setState(() {
      inProcess = true;
    });
    final imageFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    if (imageFile != null) {
      setState(() {
        _image = File(imageFile.path);
      });
    }
    setState(() {
      inProcess = false;
    });
  }

  Widget dialogBox() {
    return AlertDialog(
      title: Text(
        'Service Provider',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      content: Text(
        'Choose an image from',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      actions: [
        FlatButton(
          textColor: Colors.black,
          onPressed: () {
            selectImageFromCamera();
            Navigator.pop(context);
          },
          child: Text(
            'CAMERA',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        FlatButton(
          textColor: Colors.black,
          onPressed: () {
            selectImageFromGallery();
            Navigator.pop(context);
          },
          child: Text(
            'GALLERY',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  void _trySubmit(String name, var des) async {
    // final isValid = _formKey.currentState.validate();
    // FocusScope.of(context).unfocus();
    //
    // if(_image==null) {
    //   final snackBar = SnackBar(
    //     elevation: 10,
    //     duration: Duration(seconds: 5),
    //     behavior: SnackBarBehavior.floating,
    //     margin: EdgeInsets.all(10),
    //     // shape: ShapeBorder.,
    //     backgroundColor:
    //     Colors.brown[300].withOpacity(0.7),
    //     content: Container(
    //       height: 60,
    //       width: 500,
    //       decoration: BoxDecoration(
    //         // color: Colors.green[200],
    //         // border: Border.all(
    //         //   // color: Colors.red,
    //         //     width: 1,
    //         //     color: Colors.black
    //         // ),
    //         borderRadius: BorderRadius.circular(35),
    //       ),
    //       child: Row(
    //         children: <Widget>[
    //           Container(
    //             height: 60,
    //             width: 60,
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage(
    //                     "asset/warning-logo.png"),
    //                 fit: BoxFit.contain,
    //               ),
    //               shape: BoxShape.rectangle,
    //             ),
    //           ),
    //           SizedBox(
    //             width: 20,
    //           ),
    //           Column(
    //             mainAxisAlignment:
    //             MainAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 "WARNING !",
    //                 style: TextStyle(
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 20,
    //                     color: Colors.black),
    //               ),
    //               SizedBox(
    //                 height: 3,
    //               ),
    //               Text(
    //                 "Please add an image !",
    //                 style: TextStyle(
    //                     fontSize: 10,
    //                     color: Colors.black),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //
    //     action: SnackBarAction(
    //       label: 'Okay',
    //       textColor: Colors.black,
    //       onPressed: () {
    //         // Some code to undo the change.
    //         // Navigator.pop(context);
    //         ScaffoldMessenger.of(context)
    //             .hideCurrentSnackBar();
    //       },
    //     ),
    //   );
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(snackBar);
    // }
    //
    // if (isValid && _image != null) {

    // signUp(email: _userEmail, password: _userPassword);
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          color: Colors.yellow[100],
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orange[100],
                      backgroundImage:
                          _image != null ? FileImage(_image) : null,
                    ),
                    FlatButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => dialogBox()));
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.orange[200],
                      ),
                      label: Text(' Image'),
                      textColor: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: TextFormField(
                        key: ValueKey('name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            // child: Image.asset(
                            //   "asset/food-item-logo.png",
                            //   width: 20,
                            //   height: 20,
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter service name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                      child: TextFormField(
                        key: ValueKey('des'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            des = value;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            // child: Image.asset(
                            //   "asset/food-item-logo.png",
                            //   width: 20,
                            //   height: 20,
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          labelText: 'Enter description',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        color: Colors.orange[100],
                        onPressed: () async {
                          if (_image == null || name == null || des == null) {
                            final snackBar = SnackBar(
                              elevation: 10,
                              duration: Duration(seconds: 5),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(10),
                              // shape: ShapeBorder.,
                              backgroundColor:
                                  Colors.brown[300].withOpacity(0.7),
                              content: Container(
                                height: 60,
                                width: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "asset/warning-logo.png"),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "WARNING !",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "Please enter details!!!",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              action: SnackBarAction(
                                textColor: Colors.black,
                                label: 'Okay ',
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var img_path1 = await uploadFile(_image);

                            img_path = img_path1.toString();

                            // _formKey.currentState.save();
                            var Item_id = DateTime.now();

                            print(img_path1);
                            print("khihihihi");
                            FirebaseFirestore.instance
                                .collection('admin_details_items')
                                .add({
                              'admin_details_items_key':
                                  widget.admin_id.toString(),
                              'item_id': Item_id.toString(),
                              'image': img_path,
                              'name': name,
                              'des': des,
                            });
                            final snackBar = SnackBar(
                              elevation: 10,
                              duration: Duration(seconds: 5),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(10),
                              // shape: ShapeBorder.,
                              backgroundColor:
                                  Colors.green[300].withOpacity(0.7),
                              content: Container(
                                height: 60,
                                width: 500,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "asset/right-symbol.png"),
                                          fit: BoxFit.contain,
                                        ),
                                        shape: BoxShape.rectangle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "SUCCESS !",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          "information is \nsaved Successfully !",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              action: SnackBarAction(
                                label: 'Okay',
                                textColor: Colors.black,
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            _formKey.currentState.reset();

                            setState(() {
                              _image = null;
                            });
                          }
                        },
                        // child: Text('Add'),
                        child: Text(
                          "ADD",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
