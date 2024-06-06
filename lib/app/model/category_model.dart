class CategoryModel {
  int? id;
  String? name;
  int? archives;
  int? publish;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.id,
      this.name,
      this.archives,
      this.publish,
      this.createdAt,
      this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    archives = json['archives'];
    publish = json['publish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['archives'] = archives;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
