import 'bill.dart';

class Installments {
  final List<Bill> bills;

  Installments({required this.bills});

  @override
  String toString() {
    return bills.toString();
  }
}
