import 'package:intl/intl.dart';

String dateFormatter(DateTime date) {
  var formatter = DateFormat('dd-MM-yyyy');
  String formattedDate = formatter.format(date);
  return formattedDate;
}

String weekdayDayMonth(String date) {
  final formatter = DateFormat('dd-MM-yyyy').parseStrict(date);
  final formattedDate = DateFormat("dd MMM yyyy | EEEE").format(formatter);
  // final formattedDate = DateFormat('MMMEd').format(formatter);
  return formattedDate;
}
