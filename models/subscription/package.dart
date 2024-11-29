import '../../core/abstract_classes/validatable.dart';
import '../../core/abstract_classes/priceable.dart';
import 'plan.dart';
import 'service.dart';

class Package implements Validatable, Priceable {
  final String name;
  final Plan plan;
  final List<Service> additionalServices;
  double? _actualPrice;

  Package(
    this.name,
    this.plan,
    this.additionalServices,
    this._actualPrice,
  ) {
    validate();
  }

  double get additionalServicesPrice {
    return additionalServices.fold(0, (sum, service) => sum + service.price);
  }

  double get price {
    if (_actualPrice == null) return plan.price + additionalServicesPrice;
    return _actualPrice!;
  }

  set price(double? newPrice) {
    _actualPrice = newPrice;
  }

  @override
  void validate() {
    if (name.isEmpty) throw ArgumentError("O nome do pacote é obrigatório.");
    if (plan.name.isEmpty || plan.price <= 0)
      throw ArgumentError("O plano inserido é inválido.");
    if (additionalServices.isEmpty)
      throw ArgumentError("Os serviços adicionais são inválidos.");
  }

  @override
  String toString() {
    return 'Package(name: $name, plan: $plan, additionalServices: $additionalServices, price: $price)';
  }
}
