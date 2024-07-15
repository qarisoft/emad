import 'package:emad/core/common/entitis/user.dart';
import 'package:emad/core/error/exceptions.dart';
import 'package:emad/core/error/failure.dart';
import 'package:emad/features/auth/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repository/auth_repository.dart';
import '../datasource/local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;
  const AuthRepositoryImpl(
    this.dataSource,
  );

  @override
  Future<Either<Failure, User>> currentUser() async {
     final UserModel? user = await dataSource.getCurrentUserData();
     if (user !=null) {
       return Right(user);
     }
     return Left(Failure('no user'));

  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await dataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await dataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() fn,
  ) async {
    try {
      throw UnimplementedError();
    } on AppException catch (e) {
      return left(Failure(e.message));
    }
  }
}
