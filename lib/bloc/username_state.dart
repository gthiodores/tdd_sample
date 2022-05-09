part of 'username_bloc.dart';

abstract class UsernameState extends Equatable {
  const UsernameState();
}

class UsernameHasContentState extends UsernameState {
  final String username;
  final bool correctFormat;

  const UsernameHasContentState(this.username, this.correctFormat);

  const UsernameHasContentState.initial()
      : username = '',
        correctFormat = true;

  @override
  List<Object?> get props => [username, correctFormat];
}
