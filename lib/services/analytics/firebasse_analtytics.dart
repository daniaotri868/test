// import 'package:firebase_analytics/firebase_analytics.dart';

enum _FirebaseEventType {
  sign(true),
  signUp(true),
  search(true),
  viewItem(true),
  addToWhichList(true),
  addToCart(true),
  addPaymentInfo(true),
  beginCheckOut(true),
  purchase(true),
  screenView(true),
  ;

  const _FirebaseEventType(this.isHandledByFirebase);

  final bool isHandledByFirebase;
}

class FirebaseAnalyticsService {
  final Map<String, dynamic>? parameters;

  final _FirebaseEventType _firebaseEventType;

  FirebaseAnalyticsService.sign({required String phoneNumber})
      : _firebaseEventType = _FirebaseEventType.sign,
        parameters = {"phoneNumber": phoneNumber};

  FirebaseAnalyticsService.signUp({required String phoneNumber})
      : _firebaseEventType = _FirebaseEventType.signUp,
        parameters = {"phoneNumber": phoneNumber};

  FirebaseAnalyticsService.search({required String keyword})
      : _firebaseEventType = _FirebaseEventType.search,
        parameters = {"keyword": keyword};

  FirebaseAnalyticsService.viewItem()
      : _firebaseEventType = _FirebaseEventType.viewItem,
        parameters = null;

  FirebaseAnalyticsService.addToWhichList()
      : _firebaseEventType = _FirebaseEventType.addToWhichList,
        parameters = null;

  FirebaseAnalyticsService.addToCart()
      : _firebaseEventType = _FirebaseEventType.addToCart,
        parameters = null;

  FirebaseAnalyticsService.addPaymentInfo()
      : _firebaseEventType = _FirebaseEventType.addPaymentInfo,
        parameters = null;

  FirebaseAnalyticsService.beginCheckOut()
      : _firebaseEventType = _FirebaseEventType.beginCheckOut,
        parameters = null;

  FirebaseAnalyticsService.purchase()
      : _firebaseEventType = _FirebaseEventType.purchase,
        parameters = null;

  FirebaseAnalyticsService.screenView({required String screenName})
      : _firebaseEventType = _FirebaseEventType.screenView,
        parameters = {"screen_name": screenName};

  Future<void> log() async {
    print("Logged ${_firebaseEventType.name}, parameters $parameters");
    // switch (_firebaseEventType) {
    //   case _FirebaseEventType.sign:
    //     return FirebaseAnalytics.instance.logLogin(parameters: parameters);
    //   case _FirebaseEventType.signUp:
    //     return FirebaseAnalytics.instance
    //         .logSignUp(parameters: parameters, signUpMethod: 'Phone');
    //   case _FirebaseEventType.search:
    //     return FirebaseAnalytics.instance
    //         .logSearch(searchTerm: parameters!["keyword"]);
    //   case _FirebaseEventType.viewItem:
    //     return FirebaseAnalytics.instance.logViewItem(parameters: parameters);
    //
    //   case _FirebaseEventType.addToWhichList:
    //     return FirebaseAnalytics.instance
    //         .logAddToWishlist(parameters: parameters);
    //   case _FirebaseEventType.addToCart:
    //     return FirebaseAnalytics.instance.logAddToCart(parameters: parameters);
    //   case _FirebaseEventType.addPaymentInfo:
    //     return FirebaseAnalytics.instance
    //         .logAddPaymentInfo(parameters: parameters);
    //   case _FirebaseEventType.beginCheckOut:
    //     return FirebaseAnalytics.instance
    //         .logBeginCheckout(parameters: parameters);
    //   case _FirebaseEventType.purchase:
    //     return FirebaseAnalytics.instance.logPurchase(parameters: parameters);
    //
    //   // default:
    //   //   await FirebaseAnalytics.instance.logEvent(
    //   //     name: _firebaseEventType.name,
    //   //     parameters: parameters,
    //   //   );
    //   case _FirebaseEventType.screenView:
    //     return FirebaseAnalytics.instance
    //         .logScreenView(screenName: parameters!["screen_name"]);
    // }
  }
}
