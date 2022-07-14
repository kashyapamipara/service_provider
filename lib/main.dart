import 'package:flutter/material.dart';
import 'package:service_provider/additem.dart';
import 'package:service_provider/admin_first_screen.dart';
import 'package:service_provider/authentication.dart';
import 'intro.dart';
import 'package:flutter/services.dart';
import 'container.dart';
import 'package:splashscreen/splashscreen.dart';

import 'package:firebase_core/firebase_core.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp(),);
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: new Intro(),
      title: new Text('Service Provider',textScaleFactor: 2,),
      // image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  home: Scaffold(
  // body: SingleContainer(),
    body: Splash2(),
),
    );
  }
}
