import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InfoStats(value: '345', unit: 'kcal', label: "Calories"),
        InfoStats(value: '3.6', unit: 'miles', label: "Distance"),
        InfoStats(value: '45', unit: 'minutes', label: "Duration")
    ],);
  }
}


class InfoStats extends StatelessWidget {
  final String value;
  final String unit;
  final String label;

  const InfoStats({
    Key? key,
    required this.value,
    required this.unit,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),
            children: [
              TextSpan(text: ' '),
              TextSpan(
                text: unit,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                )
              )
            ]),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500
          )),
    ],);
  }
}