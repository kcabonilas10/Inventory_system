import 'package:riverpod/riverpod.dart';
import 'services/inventory_service.dart';


//Diri kay ang provider para ma manage ang inventoryservice na class
//sulod sa inventory_service file
final inventoryProvider = Provider((ref) => InventoryService());