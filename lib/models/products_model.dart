// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  bool? success;
  Data? data;
  String? message;
  int? code;

  Product({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
        "message": message,
        "code": code,
      };
}

class Data {
  List<Datum>? data;
  Links? links;
  Meta? meta;

  Data({
    this.data,
    this.links,
    this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
      };
}

class Datum {
  int? id;
  String? name;
  String? slug;
  int? regularPrice;
  String? formattedRegularPrice;
  int? discount;
  int? discountedPrice;
  int? finalProductPrice;
  String? formattedFinalProductPrice;
  Images? image;
  String? alterText;
  dynamic links;
  int? stock;
  int? isEnablePoint;

  Datum({
    this.id,
    this.name,
    this.slug,
    this.regularPrice,
    this.formattedRegularPrice,
    this.discount,
    this.discountedPrice,
    this.finalProductPrice,
    this.formattedFinalProductPrice,
    this.image,
    this.alterText,
    this.links,
    this.stock,
    this.isEnablePoint,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        regularPrice: json["regular_price"],
        formattedRegularPrice: json["formatted_regular_price"],
        discount: json["discount"],
        discountedPrice: json["discounted_price"],
        finalProductPrice: json["final_product_price"],
        formattedFinalProductPrice: json["formatted_final_product_price"],
        image: json["image"] == null ? null : Images.fromJson(json["image"]),
        alterText: json["alter_text"],
        links: json["links"],
        stock: json["stock"],
        isEnablePoint: json["is_enable_point"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "regular_price": regularPrice,
        "formatted_regular_price": formattedRegularPrice,
        "discount": discount,
        "discounted_price": discountedPrice,
        "final_product_price": finalProductPrice,
        "formatted_final_product_price": formattedFinalProductPrice,
        "image": image?.toJson(),
        "alter_text": alterText,
        "links": links,
        "stock": stock,
        "is_enable_point": isEnablePoint,
      };
}

class Images {
  String? large;
  String? medium;
  String? small;

  Images({
    this.large,
    this.medium,
    this.small,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large: json["large"],
        medium: json["medium"],
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "small": small,
      };
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
