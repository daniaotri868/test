enum NotificationTypeEnum {
  orderDetails(value: "OrderDetails"),
  liveSupport(value: "LiveSupport"),
  wallet(value: "Wallet"),
  announcement(value: "Announcement"),
  other(value: "Other"),
  coupon(value: "Coupon,"),
  promotion(value: "Promotion"),
  ;

  final String value;

  const NotificationTypeEnum({required this.value});
}
