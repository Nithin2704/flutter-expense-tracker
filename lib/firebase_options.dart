import 'package:firebase_core/firebase_core.dart';

const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyDKLtX7D9QKUCuhHNIOOWddjyRBJdVQxmQ',
  appId: '1:179773209261:android:ffe3b7c76b550e2c6e2424',
  messagingSenderId: '179773209261',
  projectId: 'authentication-a0eb8',
);

Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: firebaseOptions,
  );
}
