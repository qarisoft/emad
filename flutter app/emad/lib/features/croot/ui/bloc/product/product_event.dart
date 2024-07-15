part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.create({required String name,required double price,required bool active}) = _CreateProduct;
  const factory ProductEvent.update({required Product product}) = _UpdateProduct;
  const factory ProductEvent.delete({required int id}) = _DeleteProduct;
}
