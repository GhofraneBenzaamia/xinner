import 'package:intl/intl.dart';

String formatMyDate(DateTime? date) {
  if (date == null) {
    return "";
  }
  return DateFormat('dd/MM/yyyy').format(date);
}

String formatMyTime(DateTime? date) {
  if (date == null) {
    return "";
  }
  return DateFormat('HH:mm').format(date);
}
