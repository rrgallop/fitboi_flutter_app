import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  const Steps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Text("4,423",
          style: TextStyle(
            fontSize: 33, 
            fontWeight: FontWeight.w900
        )),
        Text("Total Steps",
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 2
        ))
      ],),
    );
  }
}