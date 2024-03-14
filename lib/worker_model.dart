import 'package:flutter/material.dart';
import 'package:work_wave_connect/worker_signup.dart';

class WorkerModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String? work;
  final String age;
  final Gender? gender;
  final String discription;
  final String place;
  final BuildContext context;
  const WorkerModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.work,
    required this.age,
    required this.gender,
    required this.discription,
    required this.place,
    required this.context,
  });
  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Phone": phone,
      //"Work": work,
      "Place": place,
      "Discription": discription,
      "Age": age,
      // "Gender": gender,
    };
  }
}
