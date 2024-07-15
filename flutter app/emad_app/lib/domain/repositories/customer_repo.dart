import 'package:emad_app/domain/models/product/_product_model.dart';

abstract class CustomersRepo{
  Future<List<Customer>> index();

  Future<int> create(Customer customer);

  Future<int> update();
}