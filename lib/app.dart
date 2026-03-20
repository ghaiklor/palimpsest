import 'package:flutter/cupertino.dart';
import 'package:palimpsest/themes/palimpsest_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(theme: PalimpsestTheme.themeData);
  }
}
