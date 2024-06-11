class SubscriberModel {
  int? subscriberId;
  String? subscriberName;
  String? subscriberEmail;
  String? subscriberMobile;
  Null? emailVerification;
  int? packageId;
  String? packageName;
  int? price;
  int? duration;
  String? transId;
  String? regDate;
  String? expiredDate;
  int? status;
  int? remainingDays;

  SubscriberModel(
      {this.subscriberId,
      this.subscriberName,
      this.subscriberEmail,
      this.subscriberMobile,
      this.emailVerification,
      this.packageId,
      this.packageName,
      this.price,
      this.duration,
      this.transId,
      this.regDate,
      this.expiredDate,
      this.status,
      this.remainingDays});

  SubscriberModel.fromJson(Map<String, dynamic> json) {
    subscriberId = json['subscriber_id'];
    subscriberName = json['subscriber_name'];
    subscriberEmail = json['subscriber_email'];
    subscriberMobile = json['subscriber_mobile'];
    emailVerification = json['email_verification'];
    packageId = json['package_id'];
    packageName = json['package_name'];
    price = json['price'];
    duration = json['duration'];
    transId = json['trans_id'];
    regDate = json['reg_date'];
    expiredDate = json['expired_date'];
    status = json['status'];
    remainingDays = json['remaining_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subscriber_id'] = this.subscriberId;
    data['subscriber_name'] = this.subscriberName;
    data['subscriber_email'] = this.subscriberEmail;
    data['subscriber_mobile'] = this.subscriberMobile;
    data['email_verification'] = this.emailVerification;
    data['package_id'] = this.packageId;
    data['package_name'] = this.packageName;
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['trans_id'] = this.transId;
    data['reg_date'] = this.regDate;
    data['expired_date'] = this.expiredDate;
    data['status'] = this.status;
    data['remaining_days'] = this.remainingDays;
    return data;
  }
}
