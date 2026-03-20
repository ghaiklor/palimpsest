import 'package:flutter/cupertino.dart';
import 'package:palimpsest/sector/sector.dart';

class SectorPainter extends CustomPainter {
  final Sector sector;
  final double blockSize;
  final double blockGap;

  const SectorPainter({
    required this.sector,
    required this.blockSize,
    this.blockGap = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var index = 0; index < sector.cells.length; index++) {
      final block = sector.cells[index];
      final width = blockSize - (blockGap * 2);
      final height = blockSize - (blockGap * 2);
      final left = ((index % sector.columns) * blockSize) + blockGap;
      final top = ((index ~/ sector.columns) * blockSize) + blockGap;
      final rect = Rect.fromLTWH(left, top, width, height);

      final paint = Paint()..color = block.style.fillColor;

      canvas.drawRect(rect, paint);

      canvas.drawLine(
        Offset(left, top),
        Offset(left + width, top),
        Paint()
          ..color = CupertinoColors.white.withAlpha(120)
          ..strokeWidth = 0.5,
      );

      canvas.drawLine(
        Offset(left, top),
        Offset(left, top + height),
        Paint()
          ..color = CupertinoColors.white.withAlpha(120)
          ..strokeWidth = 0.5,
      );

      canvas.drawLine(
        Offset(left + width, top),
        Offset(left + width, top + height),
        Paint()
          ..color = CupertinoColors.black.withAlpha(160)
          ..strokeWidth = 0.5,
      );

      canvas.drawLine(
        Offset(left, top + height),
        Offset(left + width, top + height),
        Paint()
          ..color = CupertinoColors.black.withAlpha(160)
          ..strokeWidth = 0.5,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
