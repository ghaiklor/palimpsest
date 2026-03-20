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
}
