import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:work_wave_connect/data_repository.dart';
import 'package:work_wave_connect/person_details.dart';
import 'package:work_wave_connect/workerspage/workers_detail_page_cart.dart';

class WorkerBooking1 extends StatefulWidget {
  const WorkerBooking1({
    super.key,
  });

  @override
  State<WorkerBooking1> createState() => _WorkerBooking1State();
}

class _WorkerBooking1State extends State<WorkerBooking1> {
  Stream? jobDetails;

  getOnTheLoad() async {
    jobDetails = await DataRepository().getJobDetails();

    setState(() {});
  }

  @override
  void initState() {
    getOnTheLoad();
    super.initState();
  }

  showCartWork() async {
    final firestore = FirebaseFirestore.instance;
    final collection = firestore.collection('Booking');
    final querySnapshot = await collection.get();
    return StreamBuilder(
        stream: jobDetails,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot work = snapshot.data.docs[index];

                    for (final queryDocSnapshot in querySnapshot.docs) {
                      final data = queryDocSnapshot.data();
                      if (data != null && data['id'] == work['id']) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) {
                                return PersonDetails(
                                  profileDetails: snapshot.data.docs[index],
                                );
                              }),
                            );
                          },
                          child: work['id'] == work['id']
                              ? WorkerCart(
                                  profile: work['workerImage'] as String,
                                  yearOfExp: work['discription'] as String,
                                  name: work['name'] as String,
                                  place: (work['place'] as String),
                                  age: (work['age'] as String),
                                )
                              : Container(),
                        );
                      }
                    }
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showCartWork(),
    );
  }
}
