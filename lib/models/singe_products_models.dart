// To parse this JSON data, do
//
//     final singleProduct = singleProductFromJson(jsonString);

import 'dart:convert';

import 'package:e_commerce/models/products_model.dart';

SingleProduct singleProductFromJson(String str) =>
    SingleProduct.fromJson(json.decode(str));

String singleProductToJson(SingleProduct data) => json.encode(data.toJson());

class SingleProduct {
  bool? success;
  Data? data;
  String? message;
  int? code;

  SingleProduct({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
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
  int? id;
  String? name;
  String? slug;
  String? category;
  int? categoryId;
  int? regularPrice;
  String? formattedRegularPrice;
  int? discount;
  int? discountedPrice;
  int? finalProductPrice;
  String? formattedFinalProductPrice;
  ImagesClass? image;
  String? ogImage;
  String? alterText;
  List<Images>? multipleImages;
  dynamic video;
  String? description;
  String? shortDescription;
  dynamic links;
  int? stock;
  String? tags;
  String? brand;
  List<Attribute>? attributes;
  String? metaTitle;
  String? metaDescription;
  String? metaKeywords;
  int? isEnablePoint;

  Data({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.categoryId,
    this.regularPrice,
    this.formattedRegularPrice,
    this.discount,
    this.discountedPrice,
    this.finalProductPrice,
    this.formattedFinalProductPrice,
    this.image,
    this.ogImage,
    this.alterText,
    this.multipleImages,
    this.video,
    this.description,
    this.shortDescription,
    this.links,
    this.stock,
    this.tags,
    this.brand,
    this.attributes,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
    this.isEnablePoint,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        category: json["category"],
        categoryId: json["category_id"],
        regularPrice: json["regular_price"],
        formattedRegularPrice: json["formatted_regular_price"],
        discount: json["discount"],
        discountedPrice: json["discounted_price"],
        finalProductPrice: json["final_product_price"],
        formattedFinalProductPrice: json["formatted_final_product_price"],
        image:
            json["image"] == null ? null : ImagesClass.fromJson(json["image"]),
        ogImage: json["og_image"],
        alterText: json["alter_text"],
        multipleImages: json["multiple_images"] == null
            ? []
            : List<Images>.from(
                json["multiple_images"]!.map((x) => Images.fromJson(x))),
        video: json["video"],
        description: json["description"],
        shortDescription: json["short_description"],
        links: json["links"],
        stock: json["stock"],
        tags: json["tags"],
        brand: json["brand"],
        attributes: json["attributes"] == null
            ? []
            : List<Attribute>.from(
                json["attributes"]!.map((x) => Attribute.fromJson(x))),
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
        isEnablePoint: json["is_enable_point"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "category": category,
        "category_id": categoryId,
        "regular_price": regularPrice,
        "formatted_regular_price": formattedRegularPrice,
        "discount": discount,
        "discounted_price": discountedPrice,
        "final_product_price": finalProductPrice,
        "formatted_final_product_price": formattedFinalProductPrice,
        "image": image?.toJson(),
        "og_image": ogImage,
        "alter_text": alterText,
        "multiple_images": multipleImages == null
            ? []
            : List<dynamic>.from(multipleImages!.map((x) => x.toJson())),
        "video": video,
        "description": description,
        "short_description": shortDescription,
        "links": links,
        "stock": stock,
        "tags": tags,
        "brand": brand,
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "is_enable_point": isEnablePoint,
      };
}

class Attribute {
  int? id;
  int? productId;
  String? attributeName;
  String? attributeValue;
  int? stock;
  int? attributePrice;
  int? productDiscount;
  int? discountPrice;
  int? attributeFinalPrice;
  List<Images>? productImages;

  Attribute({
    this.id,
    this.productId,
    this.attributeName,
    this.attributeValue,
    this.stock,
    this.attributePrice,
    this.productDiscount,
    this.discountPrice,
    this.attributeFinalPrice,
    this.productImages,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        productId: json["product_id"],
        attributeName: json["attribute_name"],
        attributeValue: json["attribute_value"],
        stock: json["stock"],
        attributePrice: json["attribute_price"],
        productDiscount: json["product_discount"],
        discountPrice: json["discount_price"],
        attributeFinalPrice: json["attribute_final_price"],
        productImages: json["product_images"] == null
            ? []
            : List<Images>.from(
                json["product_images"]!.map((x) => Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "attribute_name": attributeName,
        "attribute_value": attributeValue,
        "stock": stock,
        "attribute_price": attributePrice,
        "product_discount": productDiscount,
        "discount_price": discountPrice,
        "attribute_final_price": attributeFinalPrice,
        "product_images": productImages == null
            ? []
            : List<dynamic>.from(productImages!.map((x) => x.toJson())),
      };
}

class Images {
  int? id;
  int? productId;
  int? productAttributeId;
  ImagesClass? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Images({
    this.id,
    this.productId,
    this.productAttributeId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        productId: json["product_id"],
        productAttributeId: json["product_attribute_id"],
        image:
            json["image"] == null ? null : ImagesClass.fromJson(json["image"]),
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_attribute_id": productAttributeId,
        "image": image?.toJson(),
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class ImagesClass {
  String? large;
  String? medium;
  String? small;

  ImagesClass({
    this.large,
    this.medium,
    this.small,
  });

  factory ImagesClass.fromJson(Map<String, dynamic> json) => ImagesClass(
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
