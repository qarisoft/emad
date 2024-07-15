import 'package:emad_app/app/error.dart';
import 'package:dartz/dartz.dart';

// import '../../data/network/failure.dart';
// import '../../data/network/requests.dart';
import '../../data/data_source/db/models.dart';
import '../model/models.dart';

abstract class Repository {
  Future<Either<Failure, User>> login(String email);

  Future<Either<Failure, HomeObject>> getHomeData();
  Future<Either<Failure, ProductObject>> getProductData();
}
