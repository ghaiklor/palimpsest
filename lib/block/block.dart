import 'package:palimpsest/block/block_style.dart';
import 'package:palimpsest/block/block_type.dart';

class Block {
  final BlockType type;
  final BlockStyle style;

  const Block({required this.type, required this.style});
}
