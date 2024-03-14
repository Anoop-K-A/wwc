import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:work_wave_connect/authentication.dart';
import 'package:work_wave_connect/data_model.dart';
import 'package:work_wave_connect/worker_model.dart';

class DataRepository {
  final _db = FirebaseFirestore.instance;

  createUser(usr, UserModel user) async {
    await _db
        .collection('Users')
        .doc(usr.uid)
        .collection('user')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created"),
        )
        .catchError((error, StackTrace) {
      Get.snackbar("Error", "Somthing went wrong.Try again");
      print(error.toString());
    });
  }

  createWorker(WorkerModel work) async {
    final user = FirebaseAuthMethods(FirebaseAuth.instance).user;
    await _db
        .collection('Users')
        .doc(user.uid)
        .collection('work')
        .add(work.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your data has been added"),
        );
  }
}
