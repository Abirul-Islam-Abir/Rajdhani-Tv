class LoginModel {
  bool? success;
  String? message;
  bool? token;
  int? subscriberId;

  LoginModel({this.success, this.message, this.token, this.subscriberId});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = json['token'];
    subscriberId = json['subscriber_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['token'] = this.token;
    data['subscriber_id'] = this.subscriberId;
    return data;
  }
}
