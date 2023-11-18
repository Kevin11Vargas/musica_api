import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:musica_api/models/musica.dart';
import 'package:musica_api/models/new_releases_response.dart';
import 'package:musica_api/models/popular_response.dart';

class MusicaProvider extends ChangeNotifier {
  String _baseUrl = 'api.spotify.com';
  String _accessToken = 'BQA3DlmQ7f-C4l8-sHbQuU2dMORtXF3OtamHIrXqWNSNJS-OQ_3l8TZpEfGoiD9a0ptRsQeISeF7M51T9xe3qonF-18mebc6v9oyNLI_p84_WoHo68R_eFiFZgZ7p-isJPlvg8Uaucb8jJX7Kah9FghzUVjNBEzyneOzhXDK1mjp1YLtk2XYcDB1lnm_BMBVLUnqtUrJpKcs_L2vSllI5RAVX6OpGFk3Do7Gze5VesJm9CedsgjuGo311HzK14JgYFxipiD1nA'; // Aquí almacenarás tu token de acceso
  
  List<Musica> onDisplayMusic = [];
  List<Musica> popularMusic = [];
  //Map<int, List<Album>> musicAlbums = {};

  MusicaProvider(String accessToken) {
    _accessToken = accessToken;
    getOnDisplayMusic();
    getPopularMusic();
  }

  getOnDisplayMusic() async {
    var url = Uri.https(_baseUrl, 'v1/browse/new-releases', {'country': 'MX', 'limit': '20', 'market': 'MX'});
    var headers = {
      'Authorization': 'Bearer $_accessToken', // Agrega el token de acceso a las cabeceras
    };

    final response = await http.get(url, headers: headers);
    final Map<String, dynamic> decodeData = json.decode(response.body);

    final newReleasesResponse = NewReleasesResponse.fromRawJson(response.body);
    onDisplayMusic = newReleasesResponse.results;

    notifyListeners();
  }

  getPopularMusic() async {
    var url = Uri.https(_baseUrl, 'v1/browse/popular', {'country': 'MX', 'limit': '20', 'market': 'MX'});
    var headers = {
      'Authorization': 'Bearer $_accessToken',
    };

    final response = await http.get(url, headers: headers);
    final popularResponse = PopularResponse.fromRawJson(response.body);

    popularMusic = [...popularMusic, ...popularResponse.results]; //musicItems
    notifyListeners();
  }

  // Future<List<Album>> getMusicAlbums(int musicId) async {
  //   if (musicAlbums.containsKey(musicId)) return musicAlbums[musicId]!;

  //   var url = Uri.https(_baseUrl, 'v1/music/$musicId/albums', {'limit': '10', 'market': 'MX'});
  //   var headers = {
  //     'Authorization': 'Bearer $_accessToken',
  //   };

  //   final response = await http.get(url, headers: headers);
  //   final albumsResponse = AlbumsResponse.fromRawJson(response.body);

  //   musicAlbums[musicId] = albumsResponse.albums;

  //   return albumsResponse.albums;
  // }
}