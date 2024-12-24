// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationData {
  final String id;

  final String title;
  final String body;
  final bool isRead;
  final DateTime createdAt;
  //final String? couponId;
  final String orderId;

  NotificationData({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.createdAt,
    //required this.couponId,
    required this.orderId,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      id: json['id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['isRead'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      //couponId: json['couponId'] as String,
      orderId: json['orderId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'isRead': isRead,
      'createdAt': createdAt.toIso8601String(),
      //"couponId": couponId,
      "orderId": orderId,
    };
  }

  NotificationData copyWith({
    String? id,
    String? title,
    String? body,
    bool? isRead,
    DateTime? createdAt,
  //  String? couponId,
    String? orderId,
  }) {
    return NotificationData(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
     // couponId: couponId ?? this.couponId,
      orderId: orderId ?? this.orderId,
    );
  }
}
