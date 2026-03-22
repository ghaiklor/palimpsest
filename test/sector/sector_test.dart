import 'package:flutter_test/flutter_test.dart';
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
}
