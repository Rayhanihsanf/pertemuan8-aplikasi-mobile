import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihan_firebase/auth_wrap.dart';
import 'package:latihan_firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi Firebase
  // Inisialisasi menggunakan opsi yang di-generate sesuai platform
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //   await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth Simple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Menggunakan StreamBuilder untuk mendeteksi status login
      home: const AuthWrapper(),
    );
  }
}
