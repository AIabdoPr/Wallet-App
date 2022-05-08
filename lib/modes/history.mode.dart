import 'mode.dart';

class HistoryMode extends Mode {
  const HistoryMode._(String mode) : super(mode);
  static const all = HistoryMode._("");
  static const recived = HistoryMode._("/recived");
  static const send = HistoryMode._("/send");
}
