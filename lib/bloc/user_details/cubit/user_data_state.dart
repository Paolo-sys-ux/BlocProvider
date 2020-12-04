part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {
  get userDetails => null;
}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final UserDetails userData;

  UserDataLoaded({this.userData});
}
