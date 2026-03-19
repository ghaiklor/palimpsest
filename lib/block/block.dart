import 'package:palimpsest/block/block_style.dart';
import 'package:palimpsest/block/block_type.dart';

class Block {
  final BlockType type;

  BlockStyle get style => BlockStyle.fromType(type);

  const Block({required this.type});

  factory Block.forEmpty() {
    return Block(type: BlockType.empty);
  }
}
