import 'dart:math';

import 'package:palimpsest/block/block.dart';

class Sector {
  final List<Block> cells;

  final int rows;
  final int columns;

  const Sector({
    required this.cells,
    required this.rows,
    required this.columns,
  });

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
