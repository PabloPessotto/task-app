import 'package:intl/intl.dart';

String dateFormatter(DateTime date) {
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(date);
  return formattedDate;
}
