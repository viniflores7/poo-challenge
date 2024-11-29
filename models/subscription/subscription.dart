import '../../core/abstract_classes/validatable.dart';
import '../../services/installments_service.dart';
import '../installments/installments.dart';
import 'customer.dart';
import 'package.dart';
import 'plan.dart';
import 'service.dart';

class Subscription implements Validatable {
  final Customer customer;
  final Plan? plan;
  final Package? package;
  final List<Service>? additionalServices;
  late final Installments installments;

  Subscription({
    required this.customer,
    this.plan,
    this.package,
    this.additionalServices,
  }) {
    validate();
    installments = _createInstallments();
  }

  @override
  void validate() {
    if (plan == null && package == null) {
      throw ArgumentError(
          "O cliente precisa ter pelo menos um plano ou um pacote para efetuar a assinatura.");
    }

    if (plan != null && package != null) {
      throw ArgumentError(
          "O cliente não pode ter um plano e um pacote para efetuar a assinatura.");
    }

    if (package != null && additionalServices != null) {
      if (_hasDuplicateServices) {
        throw ArgumentError(
            "Um serviço adicional do pacote já está incluído na inscrição.");
      }
    }
  }

  Installments _createInstallments() {
    final _installmentsService = InstallmentsService();

    return _installmentsService.generateInstallments(this, DateTime.now());
  }

  List<Service> get servicesToCharge {
    if (package != null && additionalServices != null) {
      return [...package!.additionalServices, ...additionalServices!];
    }

    if (package != null && additionalServices == null) {
      return package!.additionalServices;
    }

    if (package == null && additionalServices != null) {
      return additionalServices!;
    }

    return [];
  }

  bool get _hasDuplicateServices {
    if (package == null || additionalServices == null) return false;

    final packageServices = package!.additionalServices;
    for (final subscriptionService in additionalServices!) {
      if (packageServices
          .any((pkgService) => pkgService.name == subscriptionService.name)) {
        return true;
      }
    }

    return false;
  }

  @override
  String toString() {
    return "Customer: ${customer.name}\nInstallments: $installments";
  }
}
