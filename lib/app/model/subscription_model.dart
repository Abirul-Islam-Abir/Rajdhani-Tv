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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['publish'] = this.publish;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}