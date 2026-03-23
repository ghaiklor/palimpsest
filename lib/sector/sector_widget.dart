import 'package:flutter/cupertino.dart';
import 'package:palimpsest/sector/sector.dart';
import 'package:palimpsest/sector/sector_painter.dart';

class SectorWidget extends StatelessWidget {
  final Sector sector;
  final double blinkValue;

  const SectorWidget({
    super.key,
    required this.sector,
    required this.blinkValue,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final blockSize = constraints.maxWidth / sector.columns;

        return ListenableBuilder(
          listenable: sector,
          builder: (context, _) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: SectorPainter(
                sector: sector,
                blockSize: blockSize,
                blinkValue: blinkValue,
              ),
            );
          },
        );
      },
    );
  }
}
