import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gadabout/constants.dart';
import 'package:gadabout/widgets/badge.dart';

class Tile extends StatelessWidget {
  Tile({
    required this.startDestination,
    required this.endDestination,
    required this.flightDuration,
    required this.flightDistanceInMillionKms,
  });

  final String startDestination;
  final String endDestination;
  final int flightDuration;
  final double flightDistanceInMillionKms;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: CustomPaint(
            painter: TilePainter(),
            child: Container(
              width: 200.0,
              height: 270.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 0.3 * constraints.maxHeight),
                      FittedBox(
                        child: Text(
                          "$startDestination - $endDestination",
                          style: getRegularStyle(),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text("FLIGHT DURATION",
                          style: getRegularStyle(fontSize: 7.0)),
                      SizedBox(height: 5.0),
                      FittedBox(
                        child: Text("$flightDuration DAYS",
                            style: getRegularStyle()),
                      ),
                      SizedBox(height: 5.0),
                      FittedBox(
                        child: Text("$flightDistanceInMillionKms MILLION KM",
                            style: getRegularStyle(
                                fontSize: 10.0,
                                fontColor: Colors.orange[800] as Color)),
                      ),
                      Badge(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: Offset(0.0, -30.0),
            child: Container(
              height: 100.0,
              child: Image.asset("assets/warship.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class TilePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.white;

    final kWidth = size.width;
    final kHeight = size.height;

    // Left Border
    canvas.drawLine(
        Offset(0, kHeight / 8), Offset(0, kHeight - kHeight / 8), paint);
    // Top Left Arc
    canvas.drawArc(Offset(0, 0) & Size(kWidth * 2 / 6 - 5, kHeight * 2 / 8 - 5),
        pi, pi / 2, false, paint);
    // Left-Bottom Connector
    canvas.drawLine(Offset(1, kHeight - kHeight / 8 + 1),
        Offset(kWidth / 6 - 1, kHeight - 1), paint);
    // Bottom Border
    canvas.drawLine(Offset(kWidth / 6, kHeight),
        Offset(kWidth - kWidth / 8, kHeight), paint);
    // Bottom-Right Connector
    canvas.drawArc(
        Offset(kWidth - kWidth * 2 / 8, kHeight - kHeight * 2 / 8) &
            Size(kWidth * 2 / 8, kHeight * 2 / 8),
        0,
        pi / 2,
        false,
        paint);
    // Right Border
    canvas.drawLine(Offset(kWidth, kHeight - kHeight / 8),
        Offset(kWidth, kHeight / 2), paint);
    canvas.drawLine(Offset(kWidth, kHeight / 2),
        Offset(kWidth - kWidth / 20, kHeight / 2 - kHeight / 20), paint);
    canvas.drawLine(Offset(kWidth - kWidth / 20, kHeight / 2 - kHeight / 20),
        Offset(kWidth - kWidth / 20, kHeight / 2 - kHeight / 8), paint);
    canvas.drawLine(Offset(kWidth - kWidth / 20, kHeight / 2 - kHeight / 8),
        Offset(kWidth + kWidth / 20, kHeight / 2 - kHeight / 5), paint);
    canvas.drawLine(Offset(kWidth + kWidth / 20, kHeight / 2 - kHeight / 5),
        Offset(kWidth + kWidth / 20, kHeight / 8), paint);
    // Right-Top Connector
    canvas.drawLine(Offset(kWidth + kWidth / 20, kHeight / 8),
        Offset(kWidth * 4 / 6, 0), paint);
    // Top Border
    canvas.drawLine(Offset(kWidth * 4 / 6, 0), Offset(kWidth / 6, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
