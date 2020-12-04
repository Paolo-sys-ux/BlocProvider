part of 'user_details_bloc.dart';

@immutable
abstract class UserDetailsEvent {}

class GetData extends UserDetailsEvent {
  final String id, email, first_name, last_name;

  GetData({this.id, this.email, this.first_name, this.last_name});
}
