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
  static const _ioDefragInterval = 0.3;
  final IOResource _ioResource = IOResource();

  late Ticker _ticker;
  Duration _tickerLastElapsed = Duration.zero;
  double _tickerAccumulated = 0;

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
    _tickerAccumulated += dt;

    if (_tickerAccumulated >= _ioDefragInterval) {
      _tickerAccumulated = 0.0;

      if (_ioResource.value >= _ioCostPerDefrag) {
        final moved = sector.defrag();
        if (moved) _ioResource.decrementBy(_ioCostPerDefrag);
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
            DefragButton(),
          ],
        ),
      ),
    );
  }
}
