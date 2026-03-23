import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/block/block_type.dart';

class Sector extends ChangeNotifier {
  final List<Block> cells;

  final int rows;
  final int columns;

  Sector({required this.cells, required this.rows, required this.columns});

  bool startDefrag() {
    final emptyCellIndex = cells.indexWhere((c) => c.type == BlockType.empty);
    if (emptyCellIndex == -1) return false;

    final dataCellIndex = cells.indexWhere(
      (c) => c.type == BlockType.data,
      emptyCellIndex + 1,
    );

    if (dataCellIndex == -1) return false;

    cells[emptyCellIndex] = Block.writing();
    cells[dataCellIndex] = Block.reading();

    notifyListeners();
    return true;
  }

  bool completeDefrag() {
    final writingIndex = cells.indexWhere((c) => c.type == BlockType.writing);
    final readingIndex = cells.indexWhere((c) => c.type == BlockType.reading);

    if (writingIndex == -1 || readingIndex == -1) return false;

    cells[writingIndex] = Block.data();
    cells[readingIndex] = Block.empty();

    notifyListeners();
    return true;
  }

  bool isDefragmenting() {
    return cells.any(
      (c) => c.type == BlockType.reading || c.type == BlockType.writing,
    );
  }

  factory Sector.withEmptyBlocks(int rows, int columns) {
    return Sector(
      rows: rows,
      columns: columns,
      cells: List.generate(rows * columns, (_) => Block.empty()),
    );
  }

  factory Sector.withWeightedBlocks(
    int rows,
    int columns,
    Map<Block, double> weights,
  ) {
    final random = Random();
    final total = weights.values.reduce((a, b) => a + b);

    return Sector(
      rows: rows,
      columns: columns,
      cells: List.generate(rows * columns, (index) {
        var roll = random.nextDouble() * total;

        for (final entry in weights.entries) {
          roll -= entry.value;
          if (roll <= 0) return entry.key;
        }

        return weights.keys.last;
      }),
    );
  }
}
