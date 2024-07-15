import 'package:emad_app/app/error.dart';
// import 'package:emad_app/data/network/failure.dart';
// import 'package:emad_app/data/network/requests.dart';
import 'package:emad_app/domain/model/models.dart';
import 'package:emad_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../repository/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, User> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, User>> execute(LoginUseCaseInput input) async {
         return await _repository.login(input.email);
  }
}

class LoginUseCaseInput {
  String email;

  LoginUseCaseInput(this.email);
}
