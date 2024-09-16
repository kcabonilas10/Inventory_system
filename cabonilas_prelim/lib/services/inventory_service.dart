import 'package:cabonilas_prelim/models/items_model.dart';



class InventoryService {
  final List<Item> _items = [];

  // Method to add a new item to the inventory
  void addItem(Item item) {
    _items.add(item);
  }

  // Method para ma  get all  ang items sa he inventory
  List<Item> getAllItems() {
    return _items;
  }

  // Method para ma remove ang item gamit ang Item ID
  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
  }

  // Method para ma update nato ang quantity sa item
  void updateItemQuantity(String id, int newQuantity) {
    final item = _items.firstWhere((item) => item.id == id);
    
   //diri mag create nag item sa updated na quantity
    final updatedItem = Item(
      id: item.id,
      name: item.name,
      quantity: newQuantity,
      price: item.price,
    );
    
    //  then i replace niya tong new item sa old item para ma update ang quantity
    _items[_items.indexOf(item)] = updatedItem;
  }
}
