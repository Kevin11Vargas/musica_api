import 'dart:convert';
import 'musica.dart';

class PopularResponse {
  int page;
  List<Musica> results;
  int totalPages;
  int totalResults;

  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Musica>.from(json["results"].map((x) => Musica.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}


