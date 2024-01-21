import 'package:flutter/material.dart';

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
      body: Row(
        children: [
          Column(
            children: [
              Text(work['title'] as String,
                  style: Theme.of(context).textTheme.titleMedium),
              
            ],
          ),
        ],
      ),
    );
  }
}
