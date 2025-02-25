import 'package:intl/intl.dart';

abstract class Utils {
  static String blogFormatted(DateTime date) =>
      DateFormat.yMMMMd().format(date);
}
