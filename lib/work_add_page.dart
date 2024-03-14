// import 'package:flutter/material.dart';
// import 'package:work_wave_connect/person_details.dart';
// import 'package:work_wave_connect/worker_signup.dart';
// import 'package:work_wave_connect/workerspage/workers_data.dart';

// class WorkAdd extends StatelessWidget {
//   const WorkAdd({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const WorkerSignup(),
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Text('Your jobs'),
//       ),
//       body:     Expanded(
//             child: ListView.builder(
//               itemCount: workersdata.length,
//               itemBuilder: (context, index) {
//                 final work = workersdata[index];
//                 return GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) {
//                         return PersonDetails(
//                           profileDetails: work,
//                         );
//                       }),
//                     );
//                   },
//                   child: worker['title'] == work['title']
//                       ? WorkerCart(
//                           profile: work['workerImage'] as String,
//                           discription: work['discription'] as String,
//                           name: work['name'] as String,
//                           place: (work['place'] as String),
//                           age: (work['age'] as String),
//                         )
//                       : Container(),
//                 );
//               },
//             ),
//           ),,
//     );
//   }
// }
