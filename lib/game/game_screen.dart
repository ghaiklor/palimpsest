import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
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

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  final Sector sector = Sector.withWeightedBlocks(50, 30, {
    Block.empty(): 0.4,
    Block.data(): 0.6,
  });

  static const _ioCostPerDefrag = 25.0;
  static const _ioIncomeOnDefrag = 10.0;
  final IOResource _ioResource = IOResource();

  late Ticker _ticker;
  Duration _tickerLastElapsed = Duration.zero;

  final Random _defragTimeDuration = Random();
  double _defragTimeElapsed = 0;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker(_onTick)..start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _onTick(Duration elapsed) {
    final dt = (elapsed - _tickerLastElapsed).inMicroseconds / 1000000.0;
    _tickerLastElapsed = elapsed;

    if (sector.isDefragmenting()) {
      _defragTimeElapsed += dt;
      if (_defragTimeElapsed >=
          (_defragTimeDuration.nextDouble() * 2.0) + 1.0) {
        _defragTimeElapsed = 0.0;
        sector.completeDefrag();
        _ioResource.decrementBy(_ioCostPerDefrag);
      }
    } else {
      if (_ioResource.value >= _ioCostPerDefrag) {
        sector.startDefrag();
      }
    }
  }

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
            DefragButton(
              onPressed: () => _ioResource.incrementBy(_ioIncomeOnDefrag),
            ),
          ],
        ),
      ),
    );
  }
}
