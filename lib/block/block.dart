import 'package:palimpsest/block/block_style.dart';
import 'package:palimpsest/block/block_type.dart';

class Block {
  final BlockType type;

  const Block({required this.type});

  BlockStyle get style {
    return BlockStyle.of(type);
  }

  factory Block.empty() {
    return Block(type: BlockType.empty);
  }

  factory Block.data() {
    return Block(type: BlockType.data);
  }
}
