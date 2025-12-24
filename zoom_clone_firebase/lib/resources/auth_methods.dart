import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_clone_firebase/utils/utils.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();

  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      // Ensure Google Sign-In is ready
      await googleSignIn.initialize();

      // Interactive sign-in (per 7.2.0 docs)
      if (!googleSignIn.supportsAuthenticate()) {
        showSnackBar(context, "Google Sign-In not supported on this platform");
        return false;
      }

      GoogleSignInAccount? googleUser;
      try {
        googleUser = await googleSignIn.authenticate();
      } on GoogleSignInException catch (e) {
        if (e.code == GoogleSignInExceptionCode.canceled) {
          // User closed the sheet / pressed back; treat as a benign cancel.
          showSnackBar(context, "Google Sign-In was cancelled");
          return false;
        }
        showSnackBar(context, "Google Sign-In failed: ${e.code}");
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.idToken == null) {
        showSnackBar(context, "Failed to get ID token");
        return false;
      }

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user != null) {
        if (userCredential.additionalUserInfo?.isNewUser ?? false) {
          await _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }

        return true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message ?? "Error Signing in");
      return false;
    } catch (e) {
      showSnackBar(context, e.toString());
      return false;
    }

    return false;
  }
}
