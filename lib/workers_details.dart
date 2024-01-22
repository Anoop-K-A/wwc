import 'package:flutter/material.dart';
import 'package:work_wave_connect/workers_page_cart.dart';
import 'package:work_wave_connect/workers_data.dart';

class WorkersDetails extends StatelessWidget {
  final Map<String, Object> work;
  const WorkersDetails({
    super.key,
    required this.work,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(work['title'] as String,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workersdata.length,
              itemBuilder: (context, index) {
                final work = workersdata[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return WorkersDetails(work: work);
                      }),
                    );
                  },
                  child: WorkerCart(
                    image: work['imageUrl'] as String,
                    title: work['title'] as String,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
