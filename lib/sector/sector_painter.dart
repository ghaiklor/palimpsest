import 'package:flutter/cupertino.dart';
import 'package:palimpsest/sector/sector.dart';

class SectorPainter extends CustomPainter {
  final Sector sector;

  const SectorPainter({required this.sector});

  @override
  void paint(Canvas canvas, Size size) {
    for (var index = 0; index < sector.cells.length; index++) {
      final width = 24.0;
      final height = 24.0;
      final left = (index % sector.columns) * width;
      final top = (index ~/ sector.columns) * height;
      final rect = Rect.fromLTWH(left, top, width, height);
      final paint = Paint()..color = sector.cells[index].style.fillColor;

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
