import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signUpUser(String email, String password, String username, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'username': username,
        'email': email,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Successfully Signed Up')),
      );

      debugPrint('User Successfully Signed Up');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Failed to Sign Up: $error')),
      );
      debugPrint('User Failed to Sign Up: $error');
    }
  }
}
