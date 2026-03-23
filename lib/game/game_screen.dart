import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/game/defrag_button.dart';
import 'package:palimpsest/resources/io_resource.dart';
import 'package:palimpsest/resources/io_resource_widget.dart';
import 'package:palimpsest/sector/sector.dart';
import 'package:palimpsest/sector/sector_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final Sector sector = Sector.withWeightedBlocks(50, 30, {
    Block.empty(): 0.4,
    Block.data(): 0.6,
  });

  final IOResource _ioResource = IOResource();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SectorWidget(sector: sector),
              ),
            ),
            IOResourceWidget(resource: _ioResource),
            DefragButton(),
          ],
        ),
      ),
    );
  }
}
