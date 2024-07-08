import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_expense_tracker/pages/home_page.dart';
import 'package:flutter_expense_tracker/auth/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDKLtX7D9QKUCuhHNIOOWddjyRBJdVQxmQ',
      appId: 'c6dec87895a54ad56e2424',
      messagingSenderId: '179773209261',
      projectId: 'authentication-a0eb8',
      storageBucket: 'authentication-a0eb8.appspot.com'
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            User? user = await _authService.signInWithGoogle();
            if (user != null) {
              // Successfully signed in
              Get.off(() => HomePage());
            } else {
              // Sign in failed
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Sign in failed'),
              ));
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
