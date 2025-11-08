import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

/// The entry point for the SimpleWorld application.  Initializes Firebase
/// and displays either the authentication flow or the home feed depending on
/// whether the user is signed in.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SimpleWorldApp());
}

/// The top‑level widget for the SimpleWorld app.  It listens to the
/// [FirebaseAuth.authStateChanges] stream to determine the current user and
/// shows the appropriate screen.  When the user is signed in, they see
/// [HomePage]; otherwise they see [LoginPage].
class SimpleWorldApp extends StatelessWidget {
  const SimpleWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleWorld',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Display a loading indicator while waiting for authentication state.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          // If the user is logged in, show the home page; otherwise show login.
          if (snapshot.hasData) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
    );
  }
}