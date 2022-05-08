import 'mode.dart';

class UsersMode extends Mode {
  const UsersMode._(String mode) : super(mode);
  static const all = UsersMode._("");
  static const today = UsersMode._("?rangeDate=thisDay");
  static const thisMonth = UsersMode._("?rangeDate=thisMonth");
  static const thisYear = UsersMode._("?rangeDate=thisYear");
}
