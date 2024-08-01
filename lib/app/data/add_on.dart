 import 'package:intl/intl.dart';

class AddOn{
  static String formatDate(DateTime date) {
    return DateFormat('dd - MMMM - yyyy').format(date);
  }
}