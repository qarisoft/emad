import 'package:emad_app/app/error.dart';
// import 'package:emad_app/data/network/failure.dart';
import 'package:emad_app/domain/model/models.dart';
import 'package:emad_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../data/data_source/db/models.dart';
import '../repository/repository.dart';

class ProductUseCase implements BaseUseCase<void, ProductObject> {
  final Repository _repository;

  ProductUseCase(this._repository);

  @override
  Future<Either<Failure, ProductObject>> execute(void input) async {
    return await _repository.getProductData();
  }
}
