import '../core/abstract_classes/priceable.dart';
import '../models/installments/charge.dart';
import '../models/subscription/subscription.dart';

class ChargeService {
  List<Charge> generateCharges(Subscription subscription, DateTime dueDate) {
    final List<Charge> charges = [];

    if (subscription.plan != null) {
      charges.add(_createCharge(subscription.plan!, dueDate));
    }

    if (subscription.package != null) {
      charges.add(_createCharge(subscription.package!, dueDate));
    }

    for (final service in subscription.servicesToCharge) {
      charges.add(_createCharge(service, dueDate));
    }

    return charges;
  }

  Charge<T> _createCharge<T extends Priceable>(T item, DateTime dueDate) {
    return Charge(
      item: item,
      price: item.price,
      createdDate: DateTime.now(),
      dueDate: dueDate,
    );
  }
}
