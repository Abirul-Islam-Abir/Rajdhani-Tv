class SubscriptionModel {
  int? id;
  String? packageName;
  int? price;
  int? duration;
  int? publish;
  String? createdAt;
  String? updatedAt;

  SubscriptionModel(
      {this.id,
      this.packageName,
      this.price,
      this.duration,
      this.publish,
      this.createdAt,
      this.updatedAt});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    price = json['price'];
    duration = json['duration'];
    publish = json['publish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_name'] = packageName;
    data['price'] = price;
    data['duration'] = duration;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
