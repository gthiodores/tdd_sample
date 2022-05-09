import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_sample/username_validator_interface.dart';

part 'username_event.dart';

part 'username_state.dart';

class UsernameBloc extends Bloc<UsernameEvent, UsernameState> {
  UsernameValidatorInterface validator;

  UsernameBloc(this.validator) : super(UsernameHasContentState.initial()) {
    on<UsernameChangedEvent>((event, emit) {
      final newUsername = event.username;
      final isValid = validator.isUsernameValid(newUsername);
      emit(UsernameHasContentState(newUsername, isValid));
    });

    on<UsernameClearEvent>((event, emit) {
      emit(UsernameHasContentState.initial());
    });
  }
}
