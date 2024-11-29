import '../models/installments/bill.dart';
import '../models/subscription/subscription.dart';
import 'charge_service.dart';

class BillService {
  List<Bill> generateBills(
      Subscription subscription, DateTime subscriptionDate) {
    final _chargeService = ChargeService();

    final List<Bill> bills = [];

    for (int month = 1; month <= 12; month++) {
      final billDate = DateTime(
        subscriptionDate.year,
        subscriptionDate.month + month,
        subscriptionDate.day,
      );

      final charges = _chargeService.generateCharges(subscription, billDate);
      final total = charges.fold(0.0, (sum, charge) => sum + charge.price);

      final bill = Bill(
        month: billDate,
        charges: charges,
        total: total,
      );

      bills.add(bill);
    }

    return bills;
  }
}
