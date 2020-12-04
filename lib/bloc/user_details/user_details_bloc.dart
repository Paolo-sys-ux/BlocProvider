import 'dart:async';

import 'package:api_getdata/model/userdatails.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc() : super(UserDetailsInitial());

  @override
  Stream<UserDetailsState> mapEventToState(
    UserDetailsEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is GetData) {
      yield UserDetailsLoading(loadingMessage: 'Please wait...');

      await Future.delayed(const Duration(milliseconds: 3000), () {});

      yield UserDetailsFetch(
          id: event.id,
          email: event.email,
          first_name: event.first_name,
          last_name: event.last_name);
    }
  }
}
