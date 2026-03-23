import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block_type.dart';
import 'package:palimpsest/sector/sector.dart';

class SectorPainter extends CustomPainter {
  final Sector sector;

  final double blockSize;
  final double blockGap;

  final double blinkValue;

  const SectorPainter({
    required this.sector,
    required this.blockSize,
    this.blockGap = 1.0,
    this.blinkValue = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint();
    final highlightPaint = Paint()
      ..color = CupertinoColors.white.withAlpha(120)
      ..strokeWidth = 0.5;

    final shadowPaint = Paint()
      ..color = CupertinoColors.black.withAlpha(160)
      ..strokeWidth = 0.5;

    for (var index = 0; index < sector.cells.length; index++) {
      final block = sector.cells[index];
      final width = blockSize - (blockGap * 2);
      final height = blockSize - (blockGap * 2);
      final left = ((index % sector.columns) * blockSize) + blockGap;
      final top = ((index ~/ sector.columns) * blockSize) + blockGap;
      final rect = Rect.fromLTWH(left, top, width, height);

      final isReadingBlock = block.type == BlockType.reading;
      final isWritingBlock = block.type == BlockType.writing;
      final isBlinking =
          sector.isDefragmenting() && (isReadingBlock || isWritingBlock);

      final paint = fillPaint
        ..color = Color.lerp(
          block.style.fillColor,
          CupertinoColors.white,
          isBlinking ? blinkValue : 0.0,
        )!;

      canvas.drawRect(rect, paint);

      canvas.drawLine(
        Offset(left, top),
        Offset(left + width, top),
        highlightPaint,
      );

      canvas.drawLine(
        Offset(left, top),
        Offset(left, top + height),
        highlightPaint,
      );

      canvas.drawLine(
        Offset(left + width, top),
        Offset(left + width, top + height),
        shadowPaint,
      );

      canvas.drawLine(
        Offset(left, top + height),
        Offset(left + width, top + height),
        shadowPaint,
      );
    }
  }

  @override
  bool shouldRepaint(SectorPainter oldDelegate) {
    return oldDelegate.sector != sector ||
        oldDelegate.blockSize != blockSize ||
        oldDelegate.blockGap != blockGap ||
        oldDelegate.blinkValue != blinkValue;
  }
}
