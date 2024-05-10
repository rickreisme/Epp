// ignore_for_file: prefer_const_constructors


import 'package:epp_firebase/pages/auth/cadastro.dart';
import 'package:epp_firebase/pages/auth/login.dart';
import 'package:epp_firebase/pages/basic/perfil.dart';
import 'package:epp_firebase/pages/bottom_pages/bottom_bar.dart';
import 'package:epp_firebase/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:epp_firebase/services/firebase_options.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);


  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: []
    );
    return MaterialApp(
      title: 'E++',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_)=> SplashScreen(),
        '/cadastro' :(_) => Cadastro(),
        '/login': (_)=>Login(),
        '/home':(_)=> BottomBar(),
        '/perfil': (_)=>PerfilPage()
      },
      
    );
  }
}