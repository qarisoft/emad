import 'package:emad_app/app/error.dart';
// import 'package:emad_app/data/network/failure.dart';
import 'package:emad_app/domain/model/models.dart';
import 'package:emad_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHomeData();
  }
}
