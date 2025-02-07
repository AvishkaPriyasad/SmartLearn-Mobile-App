import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> loginUser(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? uid = userCredential.user?.uid;

      if (uid != null) {
        DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
        String username = userDoc['username'] ?? email;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User Successfully Logged in')),
        );

        debugPrint('User Successfully Logged in');
        return username; // Return the fetched username
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User Failed to Log in: $error')),
      );
      debugPrint('User Failed to Log in: $error');
    }

    return null;
  }
}
