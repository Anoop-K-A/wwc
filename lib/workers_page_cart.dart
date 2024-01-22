import 'package:flutter/material.dart';

class WorkerCart extends StatelessWidget {
  final String title;
  final String image;
  const WorkerCart({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 18.0, vertical: 5.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        /*decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(235, 90, 211, 227),
        ),*/
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 18.0, vertical: 18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(image),
                    height: 85,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
