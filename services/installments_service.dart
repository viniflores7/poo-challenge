import '../models/installments/bill.dart';
import '../models/installments/installments.dart';
import 'bill_service.dart';

class InstallmentsService {
  Installments generateInstallments(subscription, subscriptionDate) {
    final _billService = BillService();

    final List<Bill> bills = _billService.generateBills(
      subscription,
      subscriptionDate,
    );

    return Installments(bills: bills);
  }
}
