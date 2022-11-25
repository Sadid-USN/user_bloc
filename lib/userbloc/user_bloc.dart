import 'package:counter_bloc/models/user_model.dart';
import 'package:counter_bloc/userbloc/user_event.dart';
import 'package:counter_bloc/userbloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>(((event, emit) async {
      emit(UserLoadingState());

      try {
        final List<UserModel> users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
        print('Loaded data......');
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    }));
  }
}
