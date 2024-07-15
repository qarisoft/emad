import 'package:emad_app/domain/models/product/_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.g.dart';

part 'product.freezed.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required int id,
    @Default(0) int active,
    @Default(0) double price,
    @Default(0)  int available,
    @Default('empty')  String name,
    @JsonKey(name:'created_at')  DateTime? createdAt,
    @JsonKey(name:'updated_at')  DateTime? updatedAt,

  }) = _ProductResponse;



  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

extension ProductRes on ProductResponse{
  Product toDomain(){
    return Product(name: name,price: price,active: active==1,id: id);
  }
}