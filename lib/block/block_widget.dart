import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block.dart';

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFFFFFFF), width: 2.0),
        color: block.style.fillColor,
      ),
    );
  }
}
