import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  const Graph({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: GraphArea(),
      ),
    );
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({super.key});

  @override
  State<GraphArea> createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  List<DataPoint> graphData = [
    DataPoint(day: 1, steps: Random().nextInt(100)),
    DataPoint(day: 2, steps: Random().nextInt(100)),
    DataPoint(day: 3, steps: Random().nextInt(100)),
    DataPoint(day: 4, steps: Random().nextInt(100)),
    DataPoint(day: 5, steps: Random().nextInt(100)),
    DataPoint(day: 6, steps: Random().nextInt(100)),
    DataPoint(day: 7, steps: Random().nextInt(100)),
    DataPoint(day: 8, steps: Random().nextInt(100)),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
        painter: GraphPainter(_animationController.view, graphData: graphData)
      ),
    );
  }
}

class GraphPainter extends CustomPainter {

  final List<DataPoint> graphData;
  final Animation<double> _size;
  final Animation<double> _dotSize;

  GraphPainter(Animation<double> animation, {required this.graphData}) 
    : _size = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Interval(0.0, 0.75, curve: Curves.easeInOutCubicEmphasized))),
      _dotSize = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: animation, curve: Interval(0.75, 1, curve: Curves.easeInOutCubicEmphasized))),
      super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    
    var xSpacing = size.width / (graphData.length - 1);

    var biggestSteps = graphData
      .fold<DataPoint>(graphData[0], (p, c) => p.steps > c.steps? p : c)
      .steps;

    var yRatio = size.height / biggestSteps;
    var curveOffset = xSpacing * 0.3; // can fiddle with this

    List<Offset> offsets = [];

    var currentX = 0.0;
    for(int i = 0; i < graphData.length; i++) {
      
      var y = size.height - (graphData[i].steps * yRatio * _size.value);

      offsets.add(Offset(currentX, y));
      currentX += xSpacing;
    }

    Paint linePaint = Paint()
      ..color = Color(0xff30c3f9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..maskFilter = ui.MaskFilter.blur(BlurStyle.solid, 3)
      ..strokeWidth = 3.0;

    Paint dotOutlinePaint = Paint()
      ..color = Colors.white.withAlpha(200)
      ..strokeWidth = 8;

    Paint dotCenter = Paint()
      ..color = Color(0xff30c3f9)
      ..strokeWidth = 8;
    
    Path linePath = Path();

    Offset currentOffset = offsets[0];

    linePath.moveTo(currentOffset.dx,currentOffset.dy);

    for (int i = 1; i < offsets.length; i++){
      var x = offsets[i].dx;
      var y = offsets[i].dy;
      var c1x = currentOffset.dx + curveOffset;
      var c1y = currentOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;
      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      currentOffset = offsets[i];
      // linePath.lineTo(offsets[i].dx, offsets[i].dy);
    }

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0,size.height);

    Paint fillPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2,0),
        Offset(size.width /2, size.height),[
          Color(0xff30c3f9), Colors.white
        ])
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0;

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, shadowPaint);
    canvas.drawPath(linePath, linePaint);
    canvas.drawCircle(offsets[4], 15 * _dotSize.value, dotOutlinePaint);
    canvas.drawCircle(offsets[4], 6 * _dotSize.value, dotCenter);
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {
    return graphData != oldDelegate.graphData;
  }

}


class DataPoint {
  final int day;
  final int steps;

  DataPoint({required this.day, required this.steps});
}