import 'mode.dart';

class UIThemeMode extends Mode {
  UIThemeMode._(String mode) : super(mode);

  static UIThemeMode dark = UIThemeMode._("Dark");
  static UIThemeMode light = UIThemeMode._("Light");
}
