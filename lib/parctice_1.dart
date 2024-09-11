import 'dart:math';
import 'package:beauty/goggle_fonts.dart';
import 'package:beauty/pages/botton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Beautys extends StatelessWidget {
  const Beautys ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [BG, BG2],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/image/Updating Arrows.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Transform.rotate(
                    angle: pi / 20,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: BG2),
                        borderRadius: BorderRadius.circular(20),
                        color: third,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: CustomPaint(
                          painter: ArrowPainter(),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 91,
                        child: CustomPaint(
                          painter: CurvedDottedLinePainter(
                            color: BG2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Container(
                    width: double.infinity,
                    height: 430,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/image/perfume-removebg-preview.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Choose our products to make your skin more beautiful and gorgeous",
                      style: style(20, third),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => CustomBottomNavBar()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: third, width: 4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Let's Choose", style: myStyle(25, third)),
                          Icon(Icons.arrow_forward, color: third, size: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = BG2 // Use the color from your image
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.9, 0);
    path.lineTo(size.width * 0.9, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width * 0.9, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class CurvedDottedLinePainter extends CustomPainter {
  final Color color;
  final double dotRadius;
  final double gap;

  CurvedDottedLinePainter({
    required this.color,
    this.dotRadius = 1.5,
    this.gap = 6,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Path path = Path();
    // Create a quadratic bezier curve
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width / 10, size.height, size.width, size.height / 1);

    double pathLength = path.computeMetrics().first.length;
    double currentLength = 0.0;

    while (currentLength < pathLength) {
      var position = path.computeMetrics().first.getTangentForOffset(currentLength);
      if (position != null) {
        canvas.drawCircle(position.position, dotRadius, paint);
      }
      currentLength += dotRadius * 0.7 + gap;
    }
  }

  @override
  bool shouldRepaint(CurvedDottedLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dotRadius != dotRadius ||
        oldDelegate.gap != gap;
  }
}

