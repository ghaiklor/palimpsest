import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/sector/sector.dart';
import 'package:palimpsest/sector/sector_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sector = Sector.withWeightedBlocks(50, 30, {
      Block.empty(): 0.4,
      Block.data(): 0.6,
    });

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: SectorWidget(sector: sector)),
        ),
      ),
    );
  }
}
