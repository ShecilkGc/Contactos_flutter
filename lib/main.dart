import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/firebase_service.dart';
import 'src/Pages/HomePage/HomePage.dart';
import 'src/Pages/HomePage/FirstPage.dart';
import 'src/Pages/HomePage/SecondPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA2kh3ol3SHovSyb5OIKbtcoYhNTeUxWR4",
  authDomain: "flutter-427cd.firebaseapp.com",
  projectId: "flutter-427cd",
  storageBucket: "flutter-427cd.appspot.com",
  messagingSenderId: "550613208108",
  appId: "1:550613208108:web:9e4d002aa91a24db779589"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  
      routes: {
        '/': (context) => const HomePage(),
        '/firstPage': (context) => const FirstPage(),
        '/SecondPage': (context) => const SecondPage(),
      },
    );
  }
}
