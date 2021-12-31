import 'package:sembast/sembast.dart';

final herdersBase = intMapStoreFactory.store('herders');
final shopsBase = intMapStoreFactory.store('shops');
final ticketsBase = intMapStoreFactory.store('tickets');
final taxesBase = intMapStoreFactory.store('taxes');
final productsBase = intMapStoreFactory.store('products');
final managersBase = intMapStoreFactory.store('managers');
final loansBase = intMapStoreFactory.store('loans');
  
abstract class DbStoresBase {
  StoreRef<int, Map<String, Object?>> get herders;
  StoreRef<int, Map<String, Object?>> get shops;
  StoreRef<int, Map<String, Object?>> get tickets;
  StoreRef<int, Map<String, Object?>> get taxes;
  StoreRef<int, Map<String, Object?>> get products;
  StoreRef<int, Map<String, Object?>> get managers;
  StoreRef<int, Map<String, Object?>> get loans;
}
