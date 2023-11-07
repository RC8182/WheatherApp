import 'package:intl/intl.dart';

String getCurrentFormattedTime() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm');
  String formattedTime = formatter.format(now);

  return formattedTime;
}

String getCurrentFormattedDate() {
  var now = DateTime.now();

  var formatter = DateFormat('EEEE, MMMM d, yyyy');
  String formattedDate = formatter.format(now);

  return formattedDate;
}

String getHour(String date) {
  DateTime dateTime = DateTime.parse(date);

  int hour = dateTime.hour;
  int minutes = dateTime.minute;
  String formattedHour = hour.toString().padLeft(2, '0');
  String formattedMinutes = minutes.toString().padLeft(2, '0');

  return '$formattedHour:$formattedMinutes';
}

String formatDate(DateTime dateTime) {
  String formattedDate = DateFormat.yMMMMd('en_US').format(dateTime);
  String dayOfWeek = DateFormat('EEEE', 'en_US').format(dateTime);
  formattedDate = formattedDate.replaceFirst(RegExp(r'\d{1,2}'), dayOfWeek);
  return formattedDate;
}
