// To parse this JSON data, do
//
//     final pixabayModel = pixabayModelFromJson(jsonString);

import 'dart:convert';

PixabayModel pixabayModelFromJson(String str) => PixabayModel.fromJson(json.decode(str));

String pixabayModelToJson(PixabayModel data) => json.encode(data.toJson());

class PixabayModel {
    int totalHits;
    List<Hit> hits;
    int total;

    PixabayModel({
        this.totalHits,
        this.hits,
        this.total,
    });

    factory PixabayModel.fromJson(Map<String, dynamic> json) => new PixabayModel(
        totalHits: json["totalHits"],
        hits: new List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "totalHits": totalHits,
        "hits": new List<dynamic>.from(hits.map((x) => x.toJson())),
        "total": total,
    };
}

class Hit {
    String largeImageUrl;
    int webformatHeight;
    int webformatWidth;
    int likes;
    int imageWidth;
    int id;
    int userId;
    int views;
    int comments;
    String pageUrl;
    int imageHeight;
    String webformatUrl;
    Type type;
    int previewHeight;
    String tags;
    int downloads;
    String user;
    int favorites;
    int imageSize;
    int previewWidth;
    String userImageUrl;
    String previewUrl;

    Hit({
        this.largeImageUrl,
        this.webformatHeight,
        this.webformatWidth,
        this.likes,
        this.imageWidth,
        this.id,
        this.userId,
        this.views,
        this.comments,
        this.pageUrl,
        this.imageHeight,
        this.webformatUrl,
        this.type,
        this.previewHeight,
        this.tags,
        this.downloads,
        this.user,
        this.favorites,
        this.imageSize,
        this.previewWidth,
        this.userImageUrl,
        this.previewUrl,
    });

    factory Hit.fromJson(Map<String, dynamic> json) => new Hit(
        largeImageUrl: json["largeImageURL"],
        webformatHeight: json["webformatHeight"],
        webformatWidth: json["webformatWidth"],
        likes: json["likes"],
        imageWidth: json["imageWidth"],
        id: json["id"],
        userId: json["user_id"],
        views: json["views"],
        comments: json["comments"],
        pageUrl: json["pageURL"],
        imageHeight: json["imageHeight"],
        webformatUrl: json["webformatURL"],
        type: typeValues.map[json["type"]],
        previewHeight: json["previewHeight"],
        tags: json["tags"],
        downloads: json["downloads"],
        user: json["user"],
        favorites: json["favorites"],
        imageSize: json["imageSize"],
        previewWidth: json["previewWidth"],
        userImageUrl: json["userImageURL"],
        previewUrl: json["previewURL"],
    );

    Map<String, dynamic> toJson() => {
        "largeImageURL": largeImageUrl,
        "webformatHeight": webformatHeight,
        "webformatWidth": webformatWidth,
        "likes": likes,
        "imageWidth": imageWidth,
        "id": id,
        "user_id": userId,
        "views": views,
        "comments": comments,
        "pageURL": pageUrl,
        "imageHeight": imageHeight,
        "webformatURL": webformatUrl,
        "type": typeValues.reverse[type],
        "previewHeight": previewHeight,
        "tags": tags,
        "downloads": downloads,
        "user": user,
        "favorites": favorites,
        "imageSize": imageSize,
        "previewWidth": previewWidth,
        "userImageURL": userImageUrl,
        "previewURL": previewUrl,
    };
}

enum Type { PHOTO, VECTOR_SVG }

final typeValues = new EnumValues({
    "photo": Type.PHOTO,
    "vector/svg": Type.VECTOR_SVG
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
