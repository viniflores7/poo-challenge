import '../../core/abstract_classes/validatable.dart';

class Customer implements Validatable {
  final String name;
  final int age;

  Customer({required this.name, required this.age}) {
    validate();
  }

  @override
  void validate() {
    if (name.isEmpty) throw ArgumentError("O nome do cliente é obrigatório.");
    if (age < 18) throw ArgumentError("Idade mínima é 18 anos.");
  }

  @override
  String toString() {
    return 'Customer(name: $name, age: $age)';
  }
}
