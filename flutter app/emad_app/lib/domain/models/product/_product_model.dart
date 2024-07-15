import 'dart:async';
import 'dart:convert';

import 'package:emad_app/data/db.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models.dart';

part '_product_model.freezed.dart';

part '_product_model.g.dart';

@freezed
class Charge extends Model with _$Charge {
  const factory Charge(
      {int? id,
      @Default(0) int quantity,
      @JsonKey(name: 'product_id') required int productId,
      @Default(false) bool positive,
      @Default('in') String type}) = _Charge;

  factory Charge.fromJson(Map<String, dynamic> json) => _$ChargeFromJson(json);
}

@freezed
class Product extends Model with _$Product {
  const factory Product({
    int? id,
    @Default(0) double price,
    @Default('') String name,
    @Default(false) bool active,
  }) = _Product;

  factory Product.empty() => const Product(id: 0);

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.fromDb(Map<String, dynamic> json) => _$ProductFromJson({...json, 'active': json['active'] == 1});
}

@freezed
class Customer extends Model with _$Customer {
  const factory Customer({
    int? id,
    @Default('') String name,
    @Default(false) bool active,
  }) = _Customer;

  factory Customer.empty() => const Customer(id: 0);

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  factory Customer.fromDb(Map<String, dynamic> json) => _$CustomerFromJson({...json, 'active': json['active'] == 1});
}

@freezed
class OrderItem extends Model with _$OrderItem {
  const factory OrderItem({
    int? id,
    @Default(1) int quantity,
    @Default(0) @JsonKey(name: 'product_id') int productId,
    @Default(0) @JsonKey(name: 'order_id') int orderId,
    @Default(0) @JsonKey(name: 'price') double price,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
}

@freezed
class Order extends Model with _$Order {
  @JsonSerializable(explicitToJson: true)
  const factory Order(
      {int? id,
      @Default(2024) int year,
      @Default(0) @JsonKey(name: 'total_price') int totalPrice,
      @Default(0) @JsonKey(name: 'customer_id') int customerId,
      @Default(false) @JsonKey(name: 'is_posted') bool isPosted,
      @Default(false) @JsonKey(name: 'is_delivered') bool isDelivered,
      @JsonKey(name: 'created_at') DateTime? createdAt
      // @Default([]) List<OrderItem> contents,
      }) = _Order;

  factory Order.empty() => Order(year: DateTime.now().year);

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.fromDb(Map<String, dynamic> json) =>
      _$OrderFromJson({...json, 'is_posted': json['is_posted'] == 1, 'is_delivered': json['is_delivered'] == 1});
}

extension OrderJ on Order {
  Map<String, dynamic> toJ() => jsonDecode(toJson().toString());
}
