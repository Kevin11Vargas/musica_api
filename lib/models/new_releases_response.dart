import 'dart:convert';

import 'package:musica_api/models/musica.dart';



class NewReleasesResponse {
  Dates dates;
  int page;
  List<Musica> results;
  int totalPages;
  int totalResults;

  NewReleasesResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NewReleasesResponse.fromRawJson(String str) =>
      NewReleasesResponse.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory NewReleasesResponse.fromJson(Map<String, dynamic> json) =>
      NewReleasesResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results:
            List<Musica>.from(json["results"].map((x) => Musica.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  /*Map<String, dynamic> toJson() => {
        "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };*/
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
