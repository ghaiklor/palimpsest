import 'package:flutter/cupertino.dart';
import 'package:palimpsest/sector/sector.dart';

class SectorPainter extends CustomPainter {
  final Sector sector;
  final double blockSize;

  const SectorPainter({required this.sector, required this.blockSize});

  @override
  void paint(Canvas canvas, Size size) {
    for (var index = 0; index < sector.cells.length; index++) {
      final width = blockSize;
      final height = blockSize;
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
