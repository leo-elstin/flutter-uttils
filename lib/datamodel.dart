// To parse this JSON data, do
//
//     final dataResponse = dataResponseFromJson(jsonString);

import 'dart:convert';

DataResponse dataResponseFromJson(String str) => DataResponse.fromJson(json.decode(str));

String dataResponseToJson(DataResponse data) => json.encode(data.toJson());

class DataResponse {
    List<OfferList> offerList;
    String status;

    DataResponse({
        this.offerList,
        this.status,
    });

    factory DataResponse.fromJson(Map<String, dynamic> json) => new DataResponse(
        offerList: new List<OfferList>.from(json["offer_list"].map((x) => OfferList.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "offer_list": new List<dynamic>.from(offerList.map((x) => x.toJson())),
        "status": status,
    };
}

class OfferList {
    String cash;
    String des;
    String image;
    int img;
    String offer;

    OfferList({
        this.cash,
        this.des,
        this.image,
        this.img,
        this.offer,
    });

    factory OfferList.fromJson(Map<String, dynamic> json) => new OfferList(
        cash: json["cash"],
        des: json["des"],
        image: json["image"],
        img: json["img"],
        offer: json["offer"],
    );

    Map<String, dynamic> toJson() => {
        "cash": cash,
        "des": des,
        "image": image,
        "img": img,
        "offer": offer,
    };
}
