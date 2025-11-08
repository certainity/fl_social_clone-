# SimpleWorld – Flutter Social App

SimpleWorld is a minimal social networking application built with **Flutter** and **Firebase**.  It demonstrates how to implement user authentication, create posts, and display a real‑time feed using Firestore.

## Features

- **User authentication** – Sign up and log in using email/password with Firebase Authentication.  A secure login flow is essential for any social network【763019382370886†L141-L145】.
- **Create posts** – Authenticated users can compose short text posts.  Posts are stored in a Firestore collection along with the user’s identifier and a timestamp【763019382370886†L228-L244】.
- **Real‑time feed** – The home screen listens to the Firestore collection and displays posts ordered by timestamp.  New posts appear automatically without requiring a refresh【763019382370886†L246-L283】.
- **Sign out** – Users can safely sign out of their account from the home screen.

## Getting started

1. **Clone or download** this repository into your development environment (e.g. Codespaces or locally).  If using GitHub Codespaces you can open the project directly in `github.dev` and run Flutter commands inside the Codespace.

2. **Install Flutter** if it isn’t already installed.  Follow the official setup guide at <https://flutter.dev/docs/get-started/install>.

3. **Set up Firebase**:

   - Create a new project in the [Firebase console](https://console.firebase.google.com/).  Enable **Authentication** (email/password) and **Cloud Firestore** services【763019382370886†L150-L160】.
   - Register your Flutter app within the Firebase project and download the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files.  Add them to the `android/app` and `ios/Runner` directories respectively.
   - Use the [`flutterfire` CLI](https://firebase.flutter.dev/docs/cli/) to generate a `firebase_options.dart` file.  Run:

     ```bash
     flutterfire configure
     ```

     This will create a `lib/firebase_options.dart` file with your project’s configuration.  The provided `lib/firebase_options.dart` contains placeholder values; replace it with the generated file for a working app.

4. **Install dependencies**:

   ```bash
   flutter pub get
   ```

5. **Run the app**:

   ```bash
   flutter run
   ```

   The app starts by initializing Firebase, then shows either the login screen or the home feed depending on the user’s authentication state.  You can sign up with an email and password, create posts, and view them in the real‑time feed.

## Notes

- This project uses the latest FlutterFire plugin versions from the Flutter BoM released on **November 3 2025**【334592974126364†L228-L250】.
- The UI is intentionally simple to focus on core functionality.  Feel free to extend it with likes, comments, user profiles, or image uploads.
- When deploying on web, additional configuration (such as enabling authentication providers and setting up Firebase hosting) may be required.  See the [FlutterFire documentation](https://firebase.flutter.dev) for more details.

Enjoy building with Flutter and Firebase!