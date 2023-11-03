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
