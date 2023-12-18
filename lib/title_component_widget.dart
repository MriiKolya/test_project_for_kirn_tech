import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  const TitleComponent({
    super.key,
    required this.percent,
  });

  final List<double> percent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(backgroundColor: Colors.yellow, radius: 4),
        Text(
          "Body ${percent[0].toStringAsFixed(2)} %",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const CircleAvatar(backgroundColor: Colors.purple, radius: 4),
        Text(
          "Mind ${percent[1].toStringAsFixed(2)} %",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const CircleAvatar(backgroundColor: Colors.blue, radius: 4),
        Text(
          "Spirit ${percent[2].toStringAsFixed(2)} %",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
