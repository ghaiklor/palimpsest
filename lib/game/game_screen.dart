import 'package:flutter/cupertino.dart';
import 'package:palimpsest/block/block.dart';
import 'package:palimpsest/sector/sector.dart';
import 'package:palimpsest/sector/sector_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    // TODO: sector must not be created in the game screen
    final sector = Sector.withWeightedBlocks(50, 30, {
      Block.empty(): 0.4,
      Block.data(): 0.6,
    });

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {},
                  color: const Color(0xFF00FF41),
                  child: Text(
                    'DEFRAG',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.textStyle.copyWith(
                      fontSize: 14.0,
                      letterSpacing: 4.0,
                      color: CupertinoColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
