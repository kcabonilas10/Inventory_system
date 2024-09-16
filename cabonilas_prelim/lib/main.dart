// main.dart

import 'dart:io';
import 'package:riverpod/riverpod.dart';
import 'package:cabonilas_prelim/provider.dart';
import 'package:cabonilas_prelim/models/items_model.dart';

void main() {
  final container = ProviderContainer();
  final inventoryService = container.read(inventoryProvider); // Maghimo ug instance sa InventoryService

  while (true) { 
    print('\n--- Store Inventory System ---'); 
    print('1. Add Item'); 
    print('2. View All Items'); 
    print('3. Update Item Quantity'); 
    print('4. Remove Item'); 
    print('5. Exit'); 

    var userInput = stdin.readLineSync();

    switch (userInput) {
      case '1':
        print('Enter item name:'); 
        var name = stdin.readLineSync()!; 
        print('Enter item quantity:'); 
        var quantity = int.parse(stdin.readLineSync()!); 
        print('Enter item price:'); 
        var price = double.parse(stdin.readLineSync()!); 
        var newItem = Item(  // then i set ang item id gamit ang current og date
          id: DateTime.now().toString(), 
          name: name, // I set ang pangalan
          quantity: quantity, // I set ang quantity
          price: price, // I set ang price
        );
        inventoryService.addItem(newItem); // then e add na ang item
        break;


      case '2': 
        inventoryService.getAllItems().forEach((item) {
          // Print "Out of Stock" if the item is out of stock
          if (item.isOutOfStock) {
            print('${item.name}: Out of Stock'); 

        
          } else {
            print(item.toString()); 
          }
        });
      case '3': 
      //ang logic sa case 3 kay
      //kuhaon ang id sa item then e update
        print('Enter item ID to update:'); 
        var id = stdin.readLineSync()!; 
        print('Enter new quantity:'); 
        var newQuantity = int.parse(stdin.readLineSync()!); 
        inventoryService.updateItemQuantity(id, newQuantity); 
        break;


      case '4': 
        print('Enter item ID to remove:'); 
        var id = stdin.readLineSync()!; 
        inventoryService.removeItem(id); 
        break;
      case '5': 
        exit(0); 
      default: 
        print('Invalid option.'); 
    }
  }
}
