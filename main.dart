import 'models/subscription/customer.dart';
import 'models/subscription/package.dart';
import 'models/subscription/plan.dart';
import 'models/subscription/service.dart';
import 'models/subscription/subscription.dart';

class ValidatorTest {
  void testCustomer() {
    try {
      final customer = Customer(name: "João Silva", age: 18);
      print("Cliente criado com sucesso: $customer.\n");
    } catch (e) {
      print("Erro ao criar cliente válido: $e");
    }
  }

  void testPlan() {
    try {
      final plan = Plan(name: "", price: 100);
      print("Plano criado com sucesso: $plan.\n");
    } catch (e) {
      print("Erro ao criar plano válido: $e");
    }
  }

  void testService() {
    try {
      final service = Service(name: "Canal Esportes", price: 30);
      print("Serviço criado com sucesso: $service.\n");
    } catch (e) {
      print("Erro ao criar serviço válido: $e");
    }
  }

  void testPackage() {
    try {
      final basicPlan = Plan(name: "Plano Básico", price: 100);
      final sportsService = Service(name: "Canal Esportes", price: 30);
      final moviesService = Service(name: "Canal Filmes", price: 50);

      final package = Package(
        "Pacote Premium",
        basicPlan,
        [sportsService, moviesService],
        null,
      );

      print("Pacote criado com sucesso: $package.\n");
    } catch (e) {
      print("Erro ao criar pacote válido: $e");
    }
  }

  void testSubscription() {
    try {
      final customer = Customer(name: "Carlos Mendes", age: 30);
      final plan = Plan(name: "Plano Básico", price: 100);
      final sportsService = Service(name: "Canal Esportes", price: 30);
      final newsService = Service(name: "Canal de Notícias", price: 40.25);

      final subscription = Subscription(
        customer: customer,
        plan: plan,
        additionalServices: [newsService, sportsService],
      );

      print("Assinatura criada com sucesso: $subscription.\n");
    } catch (e) {
      print("Erro ao criar assinatura válida: $e");
    }
  }

  void runTests() {
    // testCustomer();
    // testPlan();
    // testService();
    // testPackage();
    testSubscription();
  }
}

void main() {
  final test = ValidatorTest();
  test.runTests();
}
