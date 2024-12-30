import 'package:flutter/material.dart';
import 'dart:math' as math;

class TravelRadarScreen extends StatelessWidget {
  TravelRadarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // Adjust the radius as needed

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Color(0xFF00348F),
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: const [
                    Text(
                      'Light Your Beacon - Your travel radar for local connections!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Meet fellow travelers eager to socialise, just like you!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Ready to light up your journey?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF6AB1F1),
                      Color(0xFF065CED),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent,
                      spreadRadius: 3,
                      blurRadius: 12,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Click here',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size.infinite,
                      painter: OvalRadarPainter(),
                    ),
                    // Manually placing profile images
                    Positioned(
                      left: 310,
                      top: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile1.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left:20,
                      top: 155,
                      child :CircleAvatar(
                        backgroundImage: AssetImage('assets/profile2.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left:-10,
                      top: 360,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile3.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left: 120,
                      top: 220,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile4.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left:45,
                      top: 420,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile5.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left:300,
                      top:230,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile6.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left: 220,
                      top: 330,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile7.jpg'),
                        radius: 30,
                      ),
                    ),
                    Positioned(
                      left: 180,
                      top:500,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile8.jpg'),
                        radius: 30,
                      ),

                    ),
                    Positioned(
                      left: 360,
                      top: 380,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/profile8.jpg'),
                        radius: 30,
                      ),

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OvalRadarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 1.15, size.height / 1.07);

    // Draw concentric circles
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(-math.pi / 90); // Slight rotation for alignment

    for (int i = 1; i <= 5; i++) {
      final circleRect = Rect.fromCircle(
        center: Offset.zero,
        radius: 75.0 * i, // Circle radius increases
      );
      canvas.drawOval(circleRect, paint);
    }
    canvas.restore();

    // Draw dotted circles
    final dottedPaint = Paint()
      ..color = Colors.grey[700]!
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    canvas.save();
    canvas.translate(290, 510);
    canvas.rotate(-math.pi / 90); // Match rotation of the circles

    final dottedCircleRect = Rect.fromCircle(
      center: Offset.zero,
      radius: 400.0, // Adjust radius for the outermost dotted circle
    );
    _drawDottedOval(canvas, dottedCircleRect, dottedPaint);

    canvas.restore();
  }

  void _drawDottedOval(Canvas canvas, Rect rect, Paint paint) {
    const double dashLength = 10;
    const double gap = 5;

    final path = Path()..addOval(rect);
    final metrics = path.computeMetrics();

    for (final metric in metrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final start = metric.getTangentForOffset(distance)?.position;
        final end = metric.getTangentForOffset(distance + dashLength)?.position;

        if (start != null && end != null) {
          canvas.drawLine(start, end, paint);
        }
        distance += dashLength + gap;
      }
    }
  }
  void _drawContinuousOval(Canvas canvas, Rect rect, Paint paint) {
    final path = Path()..addOval(rect);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
