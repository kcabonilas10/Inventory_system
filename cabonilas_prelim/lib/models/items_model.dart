class Item {
  final String id;
  final String name;
  final int quantity;
  final double price;


//constructor ni siya para maka set tag initial value
  Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  // determine if the item is out of stock
  bool get isOutOfStock => quantity == 0;

  @override
  String toString() {
    return 'Item(id: $id, name: $name, quantity: $quantity, price: $price,)';
  }
}
