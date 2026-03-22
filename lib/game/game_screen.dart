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
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                color: CupertinoColors.transparent,
                borderRadius: BorderRadius.zero,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF00FF41).withAlpha(180),
                      width: 1.0,
                    ),
                  ),
                  child: Text(
                    'DEFRAG',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.textStyle.copyWith(
                      fontSize: 14.0,
                      letterSpacing: 4.0,
                      color: Color(0xFF00FF41),
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
