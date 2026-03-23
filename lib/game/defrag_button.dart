import 'package:flutter/cupertino.dart';

class DefragButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DefragButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CupertinoButton(
        onPressed: onPressed,
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
    );
  }
}
