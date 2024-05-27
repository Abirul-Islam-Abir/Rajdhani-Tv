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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['archives'] = this.archives;
    data['publish'] = this.publish;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
