// import 'dart:developer';

import 'package:emad_app/app/error.dart';
import 'package:emad_app/app/log.dart';
import 'package:emad_app/data/data_source/db/models.dart';
import 'package:emad_app/data/data_source/local_data_source.dart';
// import 'package:emad_app/data/data_source/remote_data_source.dart';
// import 'package:emad_app/data/mapper/mapper.dart';
// import 'package:emad_app/data/network/error_handler.dart';
// import 'package:emad_app/data/network/failure.dart';
// import 'package:emad_app/data/network/network_info.dart';

// import 'package:emad_app/data/network/requests.dart';

import 'package:emad_app/domain/model/models.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';
import '../data_source/db/sqlite.dart';

class RepositoryImpl implements Repository {
  // final RemoteDataSource _remoteDataSource;
  final LocalDataSource localDataSource;
  // final NetworkInfo _networkInfo;

  RepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, User>> login(String email) async {
    await Future.delayed(const Duration(seconds: 4));
    if (email == 'admin@gmail.com') {
          return Right(User(email));
    }
    return Left(Failure(message: 'wrong',code: 0));
  }

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async {
    // final response = await localDataSource.getHomeData();
    // final db = await  Db.db();

    final data = await Db.database.query('products');

    print(data);
    return Right(HomeObject(data.map((e)
    => Product(
      name: e['name'].toString(),
      price: double.parse(e['price'].toString()),
    )..id=int.parse(e['id'].toString()),
    ).toList()));
  }

  @override
  Future<Either<Failure, ProductObject>> getProductData()async {
    // TODO: implement getProductData
    final a = await Db.database.query('products');
    List<Product> data = a.map((e)
    => Product(
      name: e['name'].toString(),
      price: double.parse(e['price'].toString()),
    )..id=int.parse(e['id'].toString()),
    ).toList();
    return Right(ProductObject(data));
  }
}
