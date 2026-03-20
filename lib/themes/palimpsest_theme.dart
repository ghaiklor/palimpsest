import 'package:flutter/cupertino.dart';

class PalimpsestTheme {
  static final Color _inkBlack = Color(0xFF030603);
  static final Color _phosphorGreen = Color(0xFF00FF41);

  static TextStyle get textStyle {
    return TextStyle();
  }

  static CupertinoTextThemeData get textTheme {
    return CupertinoTextThemeData(textStyle: textStyle);
  }

  static CupertinoThemeData get themeData {
    return CupertinoThemeData(
      applyThemeToAll: true,
      brightness: Brightness.dark,
      primaryColor: _phosphorGreen,
      scaffoldBackgroundColor: _inkBlack,
      textTheme: textTheme,
    );
  }
}
