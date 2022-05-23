import 'package:intl/intl.dart';

String toLocale(DateTime date, dynamic locale) {
  return DateFormat.yMMMd(locale).format(date);
}
