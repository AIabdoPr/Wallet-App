import 'mode.dart';

class HistoryMode extends Mode {
  const HistoryMode._(String mode) : super(mode);
  static const all = HistoryMode._("");
  static const recive = HistoryMode._("Recive");
  static const send = HistoryMode._("Send");
}
