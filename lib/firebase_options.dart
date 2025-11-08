// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';

/// A placeholder configuration for Firebase.  When you configure your Firebase
/// project using the `flutterfire` CLI, this file will be replaced with
/// automatically generated values.  See the README for setup instructions.
///
/// The FirebaseOptions class encapsulates platform‑specific configuration such
/// as API keys and project identifiers.  Without valid values the app will
/// initialize Firebase but no network requests will succeed.
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: 'TODO_REPLACE_WITH_YOUR_API_KEY',
      appId: 'TODO_REPLACE_WITH_YOUR_APP_ID',
      messagingSenderId: 'TODO_REPLACE_WITH_YOUR_SENDER_ID',
      projectId: 'TODO_REPLACE_WITH_YOUR_PROJECT_ID',
      // For web builds you may need additional parameters such as authDomain,
      // storageBucket, etc.  Those are omitted here for brevity.
    );
  }
}