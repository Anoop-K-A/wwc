import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:work_wave_connect/show_snack_bar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  Stream<User?> get authState => FirebaseAuth.instance.idTokenChanges();

  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  Future<void> logInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        // ignore: use_build_context_synchronously
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification send!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> logout() async => _auth.signOut();
}
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }

//   _setInitialScreen(User? user) {
//     user == null
//         ? Get.offAll(() => const HomePage())
//         : Get.offAll(() => const Welcome());
//   }

//   Future<void> createUserWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       firebaseUser.value != null
//           ? Get.offAll(() => const Welcome())
//           : Get.to(() => const HomePage());
//     } on FirebaseAuthException catch (e) {
//       final ex = SignUpWithEmailAndPasswordFaliure.code(e.code);
//       print('FIREBASE AUTH EXCEPTION -${ex.message}');
//       throw ex;
//     } catch (_) {
//       final ex = SignUpWithEmailAndPasswordFaliure();
//       print('EXCEPTION -${ex.message}');
//       throw ex;
//     }
//   }

//   Future<void> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//     } catch (_) {}
//   }

//   Future<void> logout() async => _auth.signOut();
// }
