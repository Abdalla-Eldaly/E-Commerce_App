/// id : 1
/// name : "Clothes"
/// slug : "clothes"
/// image : "https://i.imgur.com/QkIa5tT.jpeg"
/// creationAt : "2025-03-04T10:32:36.000Z"
/// updatedAt : "2025-03-04T10:32:36.000Z"

class Category {
  Category({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.creationAt, 
      this.updatedAt,});

  Category.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? name;
  String? slug;
  String? image;
  String? creationAt;
  String? updatedAt;
Category copyWith({  int? id,
  String? name,
  String? slug,
  String? image,
  String? creationAt,
  String? updatedAt,
}) => Category(  id: id ?? this.id,
  name: name ?? this.name,
  slug: slug ?? this.slug,
  image: image ?? this.image,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}