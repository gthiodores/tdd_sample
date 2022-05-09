part of 'username_bloc.dart';

abstract class UsernameEvent extends Equatable {
  const UsernameEvent();
}

class UsernameChangedEvent extends UsernameEvent {
  final String username;

  const UsernameChangedEvent(this.username);

  @override
  List<Object?> get props => [username];
}

class UsernameClearEvent extends UsernameEvent {
  const UsernameClearEvent();

  @override
  List<Object?> get props => [];
}
