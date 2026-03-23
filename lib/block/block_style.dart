import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block_type.dart';

class BlockStyle {
  final Color fillColor;

  const BlockStyle({required this.fillColor});

  factory BlockStyle.of(BlockType type) {
    return switch (type) {
      BlockType.empty => const BlockStyle(fillColor: Color(0xFF404040)),
      BlockType.data => const BlockStyle(fillColor: Color(0xFF1A4A8A)),
      BlockType.reading => const BlockStyle(fillColor: Color(0xFFFFFFFF)),
      BlockType.writing => const BlockStyle(fillColor: Color(0xFF00E5FF)),
    };
  }
}
