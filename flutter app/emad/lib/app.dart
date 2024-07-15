import 'package:emad/features/auth/data/datasource/local_datasource.dart';
import 'package:emad/features/croot/data/datasource/datasource.dart';
import 'package:emad/features/croot/ui/bloc/customer/customer_bloc.dart';
import 'package:emad/features/croot/ui/bloc/order/order_bloc.dart';
import 'package:emad/features/croot/ui/bloc/product/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/common/cubits/user/user_cubit.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/domain/usecase/current_user.dart';
import 'features/auth/domain/usecase/user_login.dart';
import 'features/auth/domain/usecase/user_sign_up.dart';
import 'features/auth/ui/bloc/auth_bloc.dart';

enum Env { fake, dev, prod }

final serviceLocator = GetIt.instance;
const env = Env.fake;

Future<void> initApp() async {
  serviceLocator.registerLazySingleton(
    () => UserCubit(),
  );

  switch (env) {
    case Env.fake:
      await initFakeApp();
    case Env.dev:
      await initDevApp();
    case Env.prod:
      await initProdApp();
  }
  _initAuth();
  _initApp();
}

Future<void> initFakeApp() async {
  serviceLocator.registerFactory<AuthDataSource>(() => FAuthDataSourceImpl());
}

Future<void> initDevApp() async {
  serviceLocator.registerFactory<AuthDataSource>(
    () => AuthDataSourceImpl(
        // serviceLocator(),
        ),
  );
}

Future<void> initProdApp() async {
  serviceLocator.registerFactory<AuthDataSource>(
    () => AuthDataSourceImpl(),
  );
}

void _initAuth() {
  serviceLocator
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
        // serviceLocator(),
      ),
    )
    // Usecases
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}

void _initApp() async {
  
  serviceLocator
      ..registerLazySingleton<DataSource>(()=>DatasourceImpl())
    ..registerLazySingleton(() => ProductBloc(serviceLocator()))
    ..registerLazySingleton(() => CustomerBloc(serviceLocator()))
    ..registerLazySingleton(()=>OrderBloc());
}
