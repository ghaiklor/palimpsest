import 'package:flutter_test/flutter_test.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/block/block_type.dart';
import 'package:palimpsest/sector/sector.dart';

void main() {
  test('should create a sector with empty blocks', () {
    final sector = Sector.withEmptyBlocks(50, 30);

    expect(sector.cells.length, 1500);
    expect(sector.cells.map((b) => b.type).toSet(), {BlockType.empty});
    expect(sector.rows, 50);
    expect(sector.columns, 30);
  });

  test('should create a sector with weighted blocks', () {
    final sector = Sector.withWeightedBlocks(50, 30, {
      Block.empty(): 0.4,
      Block.data(): 0.6,
    });

    expect(sector.cells.length, 1500);
    expect(sector.rows, 50);
    expect(sector.columns, 30);
    expect(sector.cells.map((b) => b.type).toSet(), {
      BlockType.empty,
      BlockType.data,
    });

    expect(
      sector.cells.where((b) => b.type == .empty).length / sector.cells.length,
      closeTo(0.4, 0.05),
    );

    expect(
      sector.cells.where((b) => b.type == .data).length / sector.cells.length,
      closeTo(0.6, 0.05),
    );
  });
}
