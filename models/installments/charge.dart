class Charge<T> {
  final T item;
  final double price;
  final DateTime createdDate;
  final DateTime dueDate;

  Charge({
    required this.item,
    required this.price,
    required this.createdDate,
    required this.dueDate,
  });

  @override
  String toString() {
    return "Charge(item: $item, price: $price, createdDate: $createdDate, dueDate: $dueDate)";
  }
}
