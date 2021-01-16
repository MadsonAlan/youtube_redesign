import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_redesign/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAv9A_RU_XTND2VXAvIt71pDBysnVcHYPA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  String idCanal = "UCU5JicSrEM5A63jkJ2QvGYw";
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&maxResults=20"
            "&order=viewCount"
            "&type=video"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$idCanal"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

      //print("Resultado: " + videos.toString() );

      /*
      for( var video in dadosJson["items"] ){
        print("Resultado: " + video.toString() );
      }*/
      //print("resultado: " + dadosJson["items"].toString() );

    } else {}
  }
}
