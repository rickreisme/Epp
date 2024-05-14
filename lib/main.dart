
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epp/pages/auth/cadastro.dart';
import 'package:epp/pages/auth/login.dart';
import 'package:epp/pages/basic/perfil.dart';
import 'package:epp/pages/bottom_pages/bottom_bar.dart';
import 'package:epp/services/firebase_service.dart';
import 'package:epp/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:epp/firebase_options.dart';

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

  const MyApp({super.key, required this.firebaseService});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'E++',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/cadastro': (_) => Cadastro(),
        '/login': (_) => Login(),
        '/home': (_) => BottomBar(firebaseService: firebaseService),
        '/perfil': (_) => const PerfilPage()
      },
    );
  }
}
