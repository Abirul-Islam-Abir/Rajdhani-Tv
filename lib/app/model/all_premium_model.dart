class AllPremiumModel {
  int? id;
  String? title;
  String? type;
  int? category;
  String? srcLink;
  String? description;
  int? status;

  AllPremiumModel(
      {this.id,
      this.title,
      this.type,
      this.category,
      this.srcLink,
      this.description,
      this.status});

  AllPremiumModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    category = json['category'];
    srcLink = json['src_link'];
    description = json['description'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['category'] = this.category;
    data['src_link'] = this.srcLink;
    data['description'] = this.description;
    data['status'] = this.status;
    return data;
  }
}
