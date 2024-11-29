import '../../core/abstract_classes/validatable.dart';
import '../../core/abstract_classes/priceable.dart';

class Service implements Validatable, Priceable {
  final String name;
  final double price;

  Service({required this.name, required this.price}) {
    validate();
  }

  @override
  void validate() {
    if (name.isEmpty)
      throw ArgumentError("O nome do serviço adicional é obrigatório.");
    if (price <= 0) throw ArgumentError("Valor deve ser maior que zero.");
  }

  @override
  String toString() {
    return 'Service(name: $name, price: $price)';
  }
}
