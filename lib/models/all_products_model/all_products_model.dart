// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.permalink,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.type,
    required this.status,
    required this.featured,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.dateOnSaleFrom,
    required this.dateOnSaleFromGmt,
    required this.dateOnSaleTo,
    required this.dateOnSaleToGmt,
    required this.onSale,
    required this.purchasable,
    required this.totalSales,
    required this.virtual,
    required this.downloadable,
    required this.downloads,
    required this.downloadLimit,
    required this.downloadExpiry,
    required this.externalUrl,
    required this.buttonText,
    required this.taxStatus,
    required this.taxClass,
    required this.manageStock,
    required this.stockQuantity,
    required this.backorders,
    required this.backordersAllowed,
    required this.backordered,
    required this.lowStockAmount,
    required this.soldIndividually,
    required this.weight,
    required this.dimensions,
    required this.shippingRequired,
    required this.shippingTaxable,
    required this.shippingClass,
    required this.shippingClassId,
    required this.reviewsAllowed,
    required this.averageRating,
    required this.ratingCount,
    required this.upsellIds,
    required this.crossSellIds,
    required this.parentId,
    required this.purchaseNote,
    required this.categories,
    required this.tags,
    required this.images,
    required this.attributes,
    required this.defaultAttributes,
    required this.variations,
    required this.groupedProducts,
    required this.menuOrder,
    required this.priceHtml,
    required this.relatedIds,
    required this.metaData,
    required this.stockStatus,
    required this.links,
  });

  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  dynamic price;
  String regularPrice;
  String salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool onSale;
  bool purchasable;
  int totalSales;
  bool virtual;
  bool downloadable;
  List<dynamic> downloads;
  int downloadLimit;
  int downloadExpiry;
  String externalUrl;
  String buttonText;
  dynamic taxStatus;
  String taxClass;
  bool manageStock;
  int stockQuantity;
  dynamic backorders;
  bool backordersAllowed;
  bool backordered;
  dynamic lowStockAmount;
  bool soldIndividually;
  String weight;
  Dimensions dimensions;
  bool shippingRequired;
  bool shippingTaxable;
  String shippingClass;
  int shippingClassId;
  bool reviewsAllowed;
  String averageRating;
  int ratingCount;
  List<dynamic> upsellIds;
  List<dynamic> crossSellIds;
  int parentId;
  String purchaseNote;
  List<Category> categories;
  List<Category> tags;
  List<Images> images;
  List<AttributeElement> attributes;
  List<dynamic> defaultAttributes;
  List<int> variations;
  List<dynamic> groupedProducts;
  int menuOrder;
  String priceHtml;
  List<int> relatedIds;
  List<MetaDatum> metaData;
  dynamic stockStatus;
  Links links;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    type: json["type"],
    status: json["status"],
    featured: json["featured"],
    catalogVisibility: json["catalog_visibility"],
    description: json["description"],
    shortDescription: json["short_description"],
    sku: json["sku"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    dateOnSaleFrom: json["date_on_sale_from"],
    dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
    dateOnSaleTo: json["date_on_sale_to"],
    dateOnSaleToGmt: json["date_on_sale_to_gmt"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    totalSales: json["total_sales"],
    virtual: json["virtual"],
    downloadable: json["downloadable"],
    downloads: List<dynamic>.from(json["downloads"].map((x) => x)),
    downloadLimit: json["download_limit"],
    downloadExpiry: json["download_expiry"],
    externalUrl: json["external_url"],
    buttonText: json["button_text"],
    taxStatus: json["tax_status"],
    taxClass: json["tax_class"],
    manageStock: json["manage_stock"],
    stockQuantity: json["stock_quantity"] == null ? 0 : json["stock_quantity"],
    backorders: json["backorders"],
    backordersAllowed: json["backorders_allowed"],
    backordered: json["backordered"],
    lowStockAmount: json["low_stock_amount"],
    soldIndividually: json["sold_individually"],
    weight: json["weight"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    shippingRequired: json["shipping_required"],
    shippingTaxable: json["shipping_taxable"],
    shippingClass: json["shipping_class"],
    shippingClassId: json["shipping_class_id"],
    reviewsAllowed: json["reviews_allowed"],
    averageRating: json["average_rating"],
    ratingCount: json["rating_count"],
    upsellIds: List<dynamic>.from(json["upsell_ids"].map((x) => x)),
    crossSellIds: List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
    parentId: json["parent_id"],
    purchaseNote: json["purchase_note"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    tags: List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    attributes: List<AttributeElement>.from(json["attributes"].map((x) => AttributeElement.fromJson(x))),
    defaultAttributes: List<dynamic>.from(json["default_attributes"].map((x) => x)),
    variations: List<int>.from(json["variations"].map((x) => x)),
    groupedProducts: List<dynamic>.from(json["grouped_products"].map((x) => x)),
    menuOrder: json["menu_order"],
    priceHtml: json["price_html"],
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
    metaData: List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))),
    stockStatus: json["stock_status"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "permalink": permalink,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "type": type,
    "status": status,
    "featured": featured,
    "catalog_visibility":catalogVisibility,
    "description": description,
    "short_description": shortDescription,
    "sku": sku,
    "price": price,
    "regular_price": regularPrice,
    "sale_price": salePrice,
    "date_on_sale_from": dateOnSaleFrom,
    "date_on_sale_from_gmt": dateOnSaleFromGmt,
    "date_on_sale_to": dateOnSaleTo,
    "date_on_sale_to_gmt": dateOnSaleToGmt,
    "on_sale": onSale,
    "purchasable": purchasable,
    "total_sales": totalSales,
    "virtual": virtual,
    "downloadable": downloadable,
    "downloads": List<dynamic>.from(downloads.map((x) => x)),
    "download_limit": downloadLimit,
    "download_expiry": downloadExpiry,
    "external_url": externalUrl,
    "button_text": buttonText,
    "tax_status": taxStatus,
    "tax_class": taxClass,
    "manage_stock": manageStock,
    "stock_quantity": stockQuantity == null ? 0 : stockQuantity,
    "backorders": backorders,
    "backorders_allowed": backordersAllowed,
    "backordered": backordered,
    "low_stock_amount": lowStockAmount,
    "sold_individually": soldIndividually,
    "weight": weight,
    "dimensions": dimensions.toJson(),
    "shipping_required": shippingRequired,
    "shipping_taxable": shippingTaxable,
    "shipping_class": shippingClass,
    "shipping_class_id": shippingClassId,
    "reviews_allowed": reviewsAllowed,
    "average_rating": averageRating,
    "rating_count": ratingCount,
    "upsell_ids": List<dynamic>.from(upsellIds.map((x) => x)),
    "cross_sell_ids": List<dynamic>.from(crossSellIds.map((x) => x)),
    "parent_id": parentId,
    "purchase_note": purchaseNote,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
    "default_attributes": List<dynamic>.from(defaultAttributes.map((x) => x)),
    "variations": List<dynamic>.from(variations.map((x) => x)),
    "grouped_products": List<dynamic>.from(groupedProducts.map((x) => x)),
    "menu_order": menuOrder,
    "price_html": priceHtml,
    "related_ids": List<dynamic>.from(relatedIds.map((x) => x)),
    "meta_data": List<dynamic>.from(metaData.map((x) => x.toJson())),
    "stock_status": stockStatus,
    "_links": links.toJson(),
  };
}

class AttributeElement {
  AttributeElement({
    required this.id,
    required this.name,
    required this.position,
    required this.visible,
    required this.variation,
    required this.options,
  });

  int id;
  String name;
  int position;
  bool visible;
  bool variation;
  List<String> options;

  factory AttributeElement.fromJson(Map<String, dynamic> json) => AttributeElement(
    id: json["id"],
    name: json["name"],
    position: json["position"],
    visible: json["visible"],
    variation: json["variation"],
    options: List<String>.from(json["options"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "position": position,
    "visible": visible,
    "variation": variation,
    "options": List<dynamic>.from(options.map((x) => x)),
  };
}




class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Dimensions {
  Dimensions({
    required this.length,
    required this.width,
    required this.height,
  });

  String length;
  String width;
  String height;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "length": length,
    "width": width,
    "height": height,
  };
}

class Images {
  Images({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.src,
    required this.name,
    required this.alt,
  });

  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String src;
  String name;
  String alt;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated.toIso8601String(),
    "date_created_gmt": dateCreatedGmt.toIso8601String(),
    "date_modified": dateModified.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
  };
}

class Links {
  Links({
    required this.self,
    required this.collection,
  });

  List<Collection> self;
  List<Collection> collection;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    required this.href,
  });

  String href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class MetaDatum {
  MetaDatum({
    required this.id,
    required this.key,
    required this.value,
  });

  int id;
  String key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
    id: json["id"],
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "key": key,
    "value": value,
  };
}




class The17A156306086Df4Aace4049827Aa12A2Attribute {
  The17A156306086Df4Aace4049827Aa12A2Attribute({
    required this.image,
  });

  String image;

  factory The17A156306086Df4Aace4049827Aa12A2Attribute.fromJson(Map<String, dynamic> json) => The17A156306086Df4Aace4049827Aa12A2Attribute(
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}

class The5A8B913Ebbdf432784Bd7F456Bbf40Ce {
  The5A8B913Ebbdf432784Bd7F456Bbf40Ce({
    required this.type,
    required this.size,
    required this.attributes,
  });

  String type;
  String size;
  Map<String, The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute> attributes;

  factory The5A8B913Ebbdf432784Bd7F456Bbf40Ce.fromJson(Map<String, dynamic> json) => The5A8B913Ebbdf432784Bd7F456Bbf40Ce(
    type: json["type"],
    size: json["size"],
    attributes: Map.from(json["attributes"]).map((k, v) => MapEntry<String, The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute>(k, The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "size": size,
    "attributes": Map.from(attributes).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute {
  The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute({
    required this.color,
    required this.image,
  });

  String color;
  String image;

  factory The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute.fromJson(Map<String, dynamic> json) => The5A8B913Ebbdf432784Bd7F456Bbf40CeAttribute(
    color: json["color"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "image": image,
  };
}

