import 'package:intl/intl.dart';

class Util{
  static String appId = "803335b0779e013be70b05c16a91acfb";

  static String getFormattedDate(DateTime dateTime) {
    return  DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}