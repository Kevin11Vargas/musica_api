import 'dart:convert';

class Musica {
    String albumType;
    List<Artist> artists;
    List<Copyright> copyrights;
    ExternalIds externalIds;
    ExternalUrls externalUrls;
    List<dynamic> genres;
    String href;
    String id;
    List<Image> images;
    bool isPlayable;
    String label;
    String name;
    int popularity;
    DateTime releaseDate;
    String releaseDatePrecision;
    int totalTracks;
    Tracks tracks;
    String type;
    String uri;

    Musica({
        required this.albumType,
        required this.artists,
        required this.copyrights,
        required this.externalIds,
        required this.externalUrls,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.isPlayable,
        required this.label,
        required this.name,
        required this.popularity,
        required this.releaseDate,
        required this.releaseDatePrecision,
        required this.totalTracks,
        required this.tracks,
        required this.type,
        required this.uri,
    });

    factory Musica.fromRawJson(String str) => Musica.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Musica.fromJson(Map<String, dynamic> json) => Musica(
        albumType: json["album_type"],
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        copyrights: List<Copyright>.from(json["copyrights"].map((x) => Copyright.fromJson(x))),
        externalIds: ExternalIds.fromJson(json["external_ids"]),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        isPlayable: json["is_playable"],
        label: json["label"],
        name: json["name"],
        popularity: json["popularity"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        tracks: Tracks.fromJson(json["tracks"]),
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "copyrights": List<dynamic>.from(copyrights.map((x) => x.toJson())),
        "external_ids": externalIds.toJson(),
        "external_urls": externalUrls.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "is_playable": isPlayable,
        "label": label,
        "name": name,
        "popularity": popularity,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "tracks": tracks.toJson(),
        "type": type,
        "uri": uri,
    };
}

class Artist {
    ExternalUrls externalUrls;
    String href;
    String id;
    String name;
    String type;
    String uri;

    Artist({
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.name,
        required this.type,
        required this.uri,
    });

    factory Artist.fromRawJson(String str) => Artist.fromJson(json.decode(str));

    factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": type,
        "uri": uri,
    };
}

class ExternalUrls {
    String Musica;

    ExternalUrls({
        required this.Musica,
    });

    factory ExternalUrls.fromRawJson(String str) => ExternalUrls.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        Musica: json["Musica"],
    );

    Map<String, dynamic> toJson() => {
        "Musica": Musica,
    };
}

class Copyright {
    String text;
    String type;

    Copyright({
        required this.text,
        required this.type,
    });

    factory Copyright.fromRawJson(String str) => Copyright.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Copyright.fromJson(Map<String, dynamic> json) => Copyright(
        text: json["text"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "text": text,
        "type": type,
    };
}

class ExternalIds {
    String upc;

    ExternalIds({
        required this.upc,
    });

    factory ExternalIds.fromRawJson(String str) => ExternalIds.fromJson(json.decode(str));

    factory ExternalIds.fromJson(Map<String, dynamic> json) => ExternalIds(
        upc: json["upc"],
    );

    Map<String, dynamic> toJson() => {
        "upc": upc,
    };
}

class Image {
    int height;
    String url;
    int width;

    Image({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}

class Tracks {
    String href;
    List<Item> items;
    int limit;
    dynamic next;
    int offset;
    dynamic previous;
    int total;

    Tracks({
        required this.href,
        required this.items,
        required this.limit,
        required this.next,
        required this.offset,
        required this.previous,
        required this.total,
    });

    factory Tracks.fromRawJson(String str) => Tracks.fromJson(json.decode(str));

    factory Tracks.fromJson(Map<String, dynamic> json) => Tracks(
        href: json["href"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
    };
}

class Item {
    List<Artist> artists;
    int discNumber;
    int durationMs;
    bool explicit;
    ExternalUrls externalUrls;
    String href;
    String id;
    bool isLocal;
    bool isPlayable;
    String name;
    String previewUrl;
    int trackNumber;
    String type;
    String uri;

    Item({
        required this.artists,
        required this.discNumber,
        required this.durationMs,
        required this.explicit,
        required this.externalUrls,
        required this.href,
        required this.id,
        required this.isLocal,
        required this.isPlayable,
        required this.name,
        required this.previewUrl,
        required this.trackNumber,
        required this.type,
        required this.uri,
    });

    factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        artists: List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        discNumber: json["disc_number"],
        durationMs: json["duration_ms"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        isLocal: json["is_local"],
        isPlayable: json["is_playable"],
        name: json["name"],
        previewUrl: json["preview_url"],
        trackNumber: json["track_number"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "disc_number": discNumber,
        "duration_ms": durationMs,
        "explicit": explicit,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "is_local": isLocal,
        "is_playable": isPlayable,
        "name": name,
        "preview_url": previewUrl,
        "track_number": trackNumber,
        "type": type,
        "uri": uri,
    };
}