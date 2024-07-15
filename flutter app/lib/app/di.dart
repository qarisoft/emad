import 'package:emad_app/app/app_prefs.dart';
import 'package:emad_app/data/data_source/local_data_source.dart';
// import 'package:emad_app/data/data_source/remote_data_source.dart';
// import 'package:emad_app/data/network/app_api.dart';
// import 'package:emad_app/data/network/dio_factory.dart';
// import 'package:emad_app/data/network/network_info.dart';
import 'package:emad_app/data/repository/repository_impl.dart';
import 'package:emad_app/domain/repository/repository.dart';
import 'package:emad_app/domain/usecase/home_usecase.dart';
import 'package:emad_app/domain/usecase/login_usecase.dart';
// import 'package:emad_app/domain/usecase/register_usecase.dart';
import 'package:emad_app/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:emad_app/presentation/main/pages/home/viewmodel/home_viewmodel.dart';
// import 'package:emad_app/presentation/register/view_model/register_viewmodel.dart';
// import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/product_usecase.dart';
import '../presentation/main/pages/notifications/viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  // instance.registerLazySingleton<NetworkInfo>(
  //     () => NetworkInfoImpl(InternetConnectionChecker()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // repository

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}
initProductModule() {
  if (!GetIt.I.isRegistered<ProductUseCase>()) {
    instance.registerFactory<ProductUseCase>(() => ProductUseCase(instance()));
    instance.registerFactory<ProductViewModel>(() => ProductViewModel(instance()));
  }
}
