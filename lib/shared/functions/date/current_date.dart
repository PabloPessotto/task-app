import 'package:intl/intl.dart';

String getCurrentDate() {
  DateTime now = DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(now);
  return formattedDate;
}
