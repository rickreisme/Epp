// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epp_firebase/pages/auth/cadastro.dart';
import 'package:epp_firebase/pages/auth/login.dart';
import 'package:epp_firebase/pages/basic/perfil.dart';
import 'package:epp_firebase/pages/bottom_pages/bottom_bar.dart';
import 'package:epp_firebase/services/firebase_service.dart';
import 'package:epp_firebase/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:epp_firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseService firebaseService = FirebaseService(firestore);

  if (kIsWeb) {
    await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(firebaseService: firebaseService));
}

class MyApp extends StatelessWidget {
  final FirebaseService firebaseService;

  const MyApp({Key? key, required this.firebaseService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'E++',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => SplashScreen(),
        '/cadastro': (_) => Cadastro(),
        '/login': (_) => Login(),
        '/home': (_) => BottomBar(firebaseService: firebaseService),
        '/perfil': (_) => PerfilPage()
      },
    );
  }
}
