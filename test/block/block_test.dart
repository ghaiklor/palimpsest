import 'package:flutter_test/flutter_test.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/block/block_type.dart';

void main() {
  test('should create an empty block', () {
    final block = Block.empty();

    expect(block.type, BlockType.empty);
  });

  test('should create a data block', () {
    final block = Block.data();

    expect(block.type, BlockType.data);
  });
}
