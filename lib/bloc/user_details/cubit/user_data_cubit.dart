import 'package:api_getdata/model/userdatails.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());

  void setUserData({UserDetails userDetails}) {
    if (userDetails != null) {
      emit(UserDataLoaded(userData: userDetails));
    } else {
      emit(UserDataLoading());
      //Request for Api

    }
  }
}
