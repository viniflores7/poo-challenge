import 'charge.dart';

class Bill {
  final DateTime month;
  final List<Charge> charges;
  final double total;

  Bill({
    required this.month,
    required this.charges,
    required this.total,
  });

  @override
  String toString() {
    return "Bill(month: $month, charges: $charges, total: $total)";
  }
}
