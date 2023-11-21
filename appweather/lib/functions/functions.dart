import 'package:intl/intl.dart';

String getCurrentFormattedTime() {
  var now = DateTime.now();
  var formatter = DateFormat('HH:mm');
  String formattedTime = formatter.format(now);

  return formattedTime;
}

String getYearMounth() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyyMM');
  String formattedTime = formatter.format(now);

  return formattedTime;
}

String getYesterday() {
  DateTime today = DateTime.now();
  DateTime yesterday = today.subtract(const Duration(days: 1));

  String formatYesterday = DateFormat('yyyy-MM-dd').format(yesterday);

  return formatYesterday;
}

String getToday() {
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-d');
  String formattedTime = formatter.format(now);

  return formattedTime;
}

String getTomorrow() {
  DateTime today = DateTime.now();
  DateTime tomorrow = today.add(const Duration(days: 1));

  String formatTomorrow = DateFormat('yyyy-MM-dd').format(tomorrow);

  return formatTomorrow;
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

String formatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('MMMM, EEEE d, y').format(date);
  return formattedDate;
}

double findLargest(List<double> numbers) {
  double largest = numbers[0];

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
  }

  return largest;
}

double findSmallest(List<double> numbers) {
  double smallest = numbers[0];

  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] < smallest) {
      smallest = numbers[i];
    }
  }

  return smallest;
}

// double stringTimeToDouble(horaString) {
//   List<String> partes = horaString.split(':');

//   int horas = int.parse(partes[0]);
//   int minutos = int.parse(partes[1]);

//   double valorDouble = horas + (minutos / 60.0);

//   return (valorDouble);
// }
