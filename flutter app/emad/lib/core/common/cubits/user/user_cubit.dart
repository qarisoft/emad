import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../entitis/user.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial());

  void updateUser(User? user) {
    if (user == null) {
      emit(const _Initial());
    } else {
      emit(IsLogIn(user: user));
    }
  }
}
