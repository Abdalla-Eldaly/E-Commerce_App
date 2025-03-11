import 'Category.dart';

/// id : 2
/// title : "Hoodie"
/// slug : "hoodie"
/// price : 10
/// description : "Elevate your casual wardrobe with our Classic Red Pullover Hoodie. Crafted with a soft cotton blend for ultimate comfort, this vibrant red hoodie features a kangaroo pocket, adjustable drawstring hood, and ribbed cuffs for a snug fit. The timeless design ensures easy pairing with jeans or joggers for a relaxed yet stylish look, making it a versatile addition to your everyday attire."
/// category : {"id":1,"name":"Clothes","slug":"clothes","image":"https://i.imgur.com/QkIa5tT.jpeg","creationAt":"2025-03-04T10:32:36.000Z","updatedAt":"2025-03-04T10:32:36.000Z"}
/// images : ["https://i.imgur.com/1twoaDy.jpeg"]
/// creationAt : "2025-03-04T10:32:36.000Z"
/// updatedAt : "2025-03-04T11:45:49.000Z"

class ProductResponse {
  ProductResponse({
      this.id, 
      this.title, 
      this.slug, 
      this.price, 
      this.description, 
      this.category, 
      this.images, 
      this.creationAt, 
      this.updatedAt,});

  ProductResponse.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    images = json['images'] != null ? json['images'].cast<String>() : [];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? title;
  String? slug;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
ProductResponse copyWith({  int? id,
  String? title,
  String? slug,
  int? price,
  String? description,
  Category? category,
  List<String>? images,
  String? creationAt,
  String? updatedAt,
}) => ProductResponse(  id: id ?? this.id,
  title: title ?? this.title,
  slug: slug ?? this.slug,
  price: price ?? this.price,
  description: description ?? this.description,
  category: category ?? this.category,
  images: images ?? this.images,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['price'] = price;
    map['description'] = description;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['images'] = images;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}