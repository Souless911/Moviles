import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:bloc/bloc.dart';
import 'package:record/record.dart';
import 'shazam_api_state.dart';
import 'shazam_api_event.dart';

final record = Record();

Future<String> convertM4aToBase64(String filePath) async {
  final file = File(filePath);
  if (!file.existsSync()) throw Exception("El archivo no existe");

  final bytes = await file.readAsBytes();
  final base64Str = base64Encode(bytes);

  return base64Str;
}

class ShazamApiBloc extends Bloc<ShazamApiEvent, ShazamApiState> {
  ShazamApiBloc() : super(ShazamApiInitialState()) {
    on<ShazamApiEvent>(hear);
  }
  List<Map<String, dynamic>> lista = [];
  FutureOr<void> hear(event, emit) async {
    bool permision = await record.hasPermission();
    if (!permision) {
      emit(ShazamFailedListening());
    } else {
      emit(ShazamListeningState());
      String? finalPath;
      await record.start(path: finalPath);
      await Future.delayed(const Duration(seconds: 5), () {});
      finalPath = await record.stop();
      print(finalPath);
      Uri url = Uri.parse('https://api.audd.io/?return=spotify,apple_music');
      var base63 = await convertM4aToBase64(finalPath!);

      try {
        var obj = {
          "return": "apple_music,spotify",
          //insert api key here.
          "audio": base63,
        };
        var res = await post(
          url,
          body: obj,
        );

        if (res.statusCode == 200) {
          print('Uploaded!');
          dynamic resultado = jsonDecode(res.body);
          if (resultado['result'] == null) {
            emit(ShazamFailedListening());
          } else {
            var artista = resultado['result']['artist'];
            var title = resultado['result']['title'];
            var album = resultado['result']['album'];
            var imagen =
                resultado['result']['spotify']['album']['images'][0]['url'];
            var apple = resultado['result']['apple_music']['url'];
            var spotify =
                resultado['result']['spotify']['external_urls']['spotify'];
            var g_link = resultado['result']['song_link'];
            var release_date = resultado['result']['release_date'];
            lista.add({
              "artista": artista,
              "title": title,
              "album": album,
              "imagen": imagen,
              "apple": apple,
              "spotify": spotify,
              "g_link": g_link,
              "release_date": release_date
            });
            emit(ShazamFindedState(
              favorites: lista,
              title: title,
              album: album,
              artist: artista,
              image: imagen,
              apple: apple,
              g_link: g_link,
              spotify: spotify,
              release_date: release_date,
            ));
          }
        }
      } catch (e) {
        print('Error: ' + e.toString());
      }
    }
  }
}
