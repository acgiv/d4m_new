import 'package:flutter/material.dart';

class PercorrenzaKmWidget extends StatelessWidget {
  const PercorrenzaKmWidget(
      {super.key,
      required this.dataKm,
      required this.type,
      required this.numKm,
      required this.index});
  final String dataKm;
  final String type;
  final int index;
  final String numKm;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: index % 2 == 0
          ? Theme.of(context).colorScheme.tertiary
          : Theme.of(context).colorScheme.surface,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataKm,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   type,
                //   style: TextStyle(
                //       fontSize: 14,
                //       fontWeight: FontWeight.bold,
                //       color: Theme.of(context).colorScheme.primary),
                // ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              '$numKm km',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
