import 'package:palimpsest/block/block_style.dart';
import 'package:palimpsest/block/block_type.dart';

class Block {
  final BlockType type;
  final BlockStyle style;

  const Block({required this.type, required this.style});

  factory Block.forEmpty() {
    return Block(
      type: BlockType.empty,
      style: BlockStyle.fromType(BlockType.empty),
    );
  }
}
