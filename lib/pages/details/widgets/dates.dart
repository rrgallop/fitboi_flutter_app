import 'package:flutter/material.dart';

class Dates extends StatelessWidget {
  const Dates({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DateBox(),
          DateBox(isActive: true),
          DateBox(),
          DateBox(),
          DateBox(),
          DateBox(),
          DateBox(),
        ],
      ),
    );
  }
}

class DateBox extends StatelessWidget {

  final bool isActive;

  const DateBox({
    super.key, this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      decoration: BoxDecoration(
        gradient: isActive? LinearGradient(
          colors: [Color(0xff92e2ff), Color(0xff1ebdf8)],
          begin: Alignment.topCenter) : null,
        border: Border.all(color: Color(0xffe1e1e1)),
        borderRadius: BorderRadius.circular(10)
      ),
      child: DefaultTextStyle.merge(
        style: isActive? TextStyle(color: Colors.white) : null,
        child: Column(
          children: [
            Text(
              'Mon',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 5),
            Text(
              '8',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w500
              )
            )
          ]
        ),
      )
    );
  }
}
