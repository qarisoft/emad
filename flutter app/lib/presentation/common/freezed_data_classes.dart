import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';
part 'freezed_data_classes.g.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName) = _LoginObject;
}

// @freezed
// class RegisterObject with _$RegisterObject {
//   factory RegisterObject(
//       String userName,
//       String countryMobileCode,
//       String mobileNumber,
//       String email,
//       String password,
//       String profilePicture) = _RegisterObject;
// }


@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String name,
    required double price

  }

      )= _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}