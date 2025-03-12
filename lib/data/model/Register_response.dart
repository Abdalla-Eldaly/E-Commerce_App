class RegisterResponse {
  RegisterResponse({
      this.id, 
      this.email, 
      this.password, 
      this.name, 
      this.role, 
      this.avatar, 
      this.creationAt, 
      this.updatedAt,});

  RegisterResponse.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    role = json['role'];
    avatar = json['avatar'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
  String? updatedAt;
RegisterResponse copyWith({  int? id,
  String? email,
  String? password,
  String? name,
  String? role,
  String? avatar,
  String? creationAt,
  String? updatedAt,
}) => RegisterResponse(  id: id ?? this.id,
  email: email ?? this.email,
  password: password ?? this.password,
  name: name ?? this.name,
  role: role ?? this.role,
  avatar: avatar ?? this.avatar,
  creationAt: creationAt ?? this.creationAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['password'] = password;
    map['name'] = name;
    map['role'] = role;
    map['avatar'] = avatar;
    map['creationAt'] = creationAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}