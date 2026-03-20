import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block_type.dart';

class BlockStyle {
  final Color fillColor;

  const BlockStyle({required this.fillColor});

  factory BlockStyle.of(BlockType type) {
    return switch (type) {
      BlockType.empty => const BlockStyle(fillColor: Color(0xFF404040)),
    };
  }
}
