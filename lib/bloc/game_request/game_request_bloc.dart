import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_request_event.dart';
part 'game_request_state.dart';

class GameRequestBloc extends Bloc<GameRequestEvent, GameRequestState> {
  GameRequestBloc() : super(GameRequestInitial());

  @override
  Stream<GameRequestState> mapEventToState(
    GameRequestEvent event,
  ) async* {
    // TODO: implement mapEventToState

    if (event is FetchCharacter) {
      yield GameRequestLoading(loadingMessage: 'Now Loading');
      var dio = Dio();

      var response =
          await dio.get('https://ap.api.riotgames.com/val/content/v1/contents',
              options: Options(headers: {
                "User-Agent":
                    "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:83.0) Gecko/20100101 Firefox/83.0",
                "Accept-Language": "en-US,en;q=0.5",
                "Accept-Charset":
                    "application/x-www-form-urlencoded; charset=UTF-8",
                "Origin": "https://developer.riotgames.com",
                "X-Riot-Token": "RGAPI-4ac21b1b-eded-4713-8aff-3ca3657a67ec"
              }));

      var data = response.data;

      yield GameRequestFetch(data["characters"]);
      print(data["characters"]);
    }
  }
}
