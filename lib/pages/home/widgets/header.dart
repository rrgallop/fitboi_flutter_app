import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          CustomPaint(
            painter: HeaderPainter(),
            size: Size(double.infinity, 200)
          ),
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              onPressed: () {}, 
              icon: Icon(Icons.menu),
              color: Colors.white
            ),
          ),
          Positioned(
            top: 30,
            right: 40,
            child: CircleAvatar(
              minRadius: 30,
              maxRadius: 30,
              foregroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          Positioned(
            left: 33,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300, 
                  fontSize: 20)
                ),
                Text('Anonymous_User', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold, 
                  fontSize: 26)
                )
            ],),
          )
        ]
      ),
    );
  }
}


class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint bgColor = Paint()..color = Color(0xff18b0e8);
    Paint circleColor = Paint()..color = Colors.white.withAlpha(40);

    canvas.drawRect(Rect.fromPoints(
      Offset(0,0),
      Offset(size.width, size.height)), 
      bgColor
    );

    canvas.drawCircle(Offset(size.width*.65, 10), 30, circleColor);
    canvas.drawCircle(Offset(size.width*.60, 130), 10, circleColor);
    canvas.drawCircle(Offset(size.width-10, size.height-10), 20, circleColor);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}