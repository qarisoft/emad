import 'package:emad/core/error/exceptions.dart';

import '../models/user_model.dart';

abstract interface class AuthDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<UserModel?> getCurrentUserData();
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl();



  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {

      // final response = await supabaseClient.auth.signInWithPassword(
      //   password: password,
      //   email: email,
      // );
      // if (response.user == null) {
      //   throw const ServerException('User is null!');
      // }
      // return UserModel.fromJson(response.user!.toJson());
    } on AppException catch (e) {
      // throw ServerException(e.message);
    } catch (e) {
      // throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // final response = await supabaseClient.auth.signUp(
      //   password: password,
      //   email: email,
      //   data: {
      //     'name': name,
      //   },
      // );
      // if (response.user == null) {
        // throw const ServerException('User is null!');
      // }
      // return UserModel.fromJson(response.user!.toJson());
    } on AppException catch (e) {
      // throw ServerException(e.message);
    } catch (e) {
      // throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      // if (currentUserSession != null) {
      //   final userData = await supabaseClient.from('profiles').select().eq(
      //     'id',
      //     currentUserSession!.user.id,
      //   );
      //   return UserModel.fromJson(userData.first).copyWith(
      //     email: currentUserSession!.user.email,
      //   );
      // }
      //
      // return null;
    } catch (e) {
      // throw ServerException(e.toString());
    }
    throw UnimplementedError();
  }
}


class FAuthDataSourceImpl implements AuthDataSource{
  static   final UserModel _user = UserModel(
    id: '1',
    name: 'fake',
    email: 'fake@t.t'
  );
  @override
  Future<UserModel?> getCurrentUserData() async{
    return _user;
  }

  @override
  Future<UserModel> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

}