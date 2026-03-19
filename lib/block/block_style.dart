import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block_type.dart';

class BlockStyle {
  final Color fillColor;

  const BlockStyle({required this.fillColor});

  factory BlockStyle.fromType(BlockType type) {
    return switch (type) {
      BlockType.empty => BlockStyle(fillColor: Color(0xFF0A0F0A)),
    };
  }
}
