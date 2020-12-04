part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsState {
  get userDetails => null;
}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {
  final String loadingMessage;

  UserDetailsLoading({this.loadingMessage});
}

class UserDetailsFetch extends UserDetailsState {
  // ignore: non_constant_identifier_names
  final String id, email, first_name, last_name;

  UserDetailsFetch(
      // ignore: non_constant_identifier_names
      {@required this.id,
      this.email,
      this.first_name,
      this.last_name});
}

class UserDetailsEmpty extends UserDetailsState {
  final String emptyMessage;

  UserDetailsEmpty({this.emptyMessage});
}

class UserDetailsError extends UserDetailsState {
  final String errorMessage;

  UserDetailsError(this.errorMessage);
}
