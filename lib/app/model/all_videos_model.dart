class AllVideosModel {
  int? id;
  String? name;
  int? archives;
  int? publish;
  String? createdAt;
  String? updatedAt;
  List<EmbedCodes>? embedCodes;

  AllVideosModel(
      {this.id,
      this.name,
      this.archives,
      this.publish,
      this.createdAt,
      this.updatedAt,
      this.embedCodes});

  AllVideosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    archives = json['archives'];
    publish = json['publish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['embed_codes'] != null) {
      embedCodes = <EmbedCodes>[];
      json['embed_codes'].forEach((v) {
        embedCodes!.add(EmbedCodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['archives'] = archives;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (embedCodes != null) {
      data['embed_codes'] = embedCodes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmbedCodes {
  int? id;
  String? title;
  String? embed;
  int? category;
  int? autoplay;
  int? muted;
  int? publish;
  String? createdAt;
  String? updatedAt;

  EmbedCodes(
      {this.id,
      this.title,
      this.embed,
      this.category,
      this.autoplay,
      this.muted,
      this.publish,
      this.createdAt,
      this.updatedAt});

  EmbedCodes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    embed = json['embed'];
    category = json['category'];
    autoplay = json['autoplay'];
    muted = json['muted'];
    publish = json['publish'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['embed'] = embed;
    data['category'] = category;
    data['autoplay'] = autoplay;
    data['muted'] = muted;
    data['publish'] = publish;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
