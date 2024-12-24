abstract class ApiRoutes {
  ApiRoutes._();

  ///App Url
  static const baseUrlDev = "http://135.181.32.162:83/api/";
  static const baseImage = "http://135.181.32.162:83/";
  // static const baseUrlDev = "https://5b52nbsh-5247.euw.devtunnels.ms/api/";
  // static const baseImage = "https://5b52nbsh-5247.euw.devtunnels.ms/";





  static const auth = _Auth();
  static const notification = _Notification();
  static const home = _Home();
  static const category = _Category();
  static const catelog = _Catelog();
  static const order = _Order();
  static const cart = _Cart();
  static const profile = _Profile();
  static const adress = _Adress();
}

class _Auth {
  const _Auth();

  final register = 'Customer/Account/Register';
  final refreshToken = 'Customer/Account/RefreshToken';
  final addUserLocationStep = 'Customer/Account/AddUserLocationStep';
  final initialRequest = 'Customer/Account/InitialRequest';
}

class _Notification {
  const _Notification();

  //final getNotification = 'User/Notification/ReadAllNotification';
 //final getNotification = 'Customer/Notification/GetAllNotification';
 final getNotification = 'Customer/Notification/GetAllNotification';
  final readNotification = 'Customer/Notification/ReadNotification';
}

class _Home {
  const _Home();

  final getAllHome = 'Customer/Home/GetHome';
  final getProductDetails = 'Customer/Product/GetProductDetails';
  final getAllCategory = 'Customer/Category/GetAllCategory';
  final productByCategory = 'Customer/Category/GetProductsByCategory';
}

class _Category {
  const _Category();

  final getAllCategory = 'User/Catalog/GetAllCategory';
  final getProductByCategory = 'User/Catalog/GetAllProductByCategory';
}

class _Cart {
  const _Cart();
  final getAllAddress='Customer/Address/GetAllAddress';
  final getAllCoupon='Customer/Coupon/GetAllCoupons';

  final getCart = 'Customer/Order/GetCart';
  final removeItem = 'Customer/Order/RemoveItem';
  final removeExtraItem = 'Customer/Order/RemoveExtraItem';
  final updateCart = 'Customer/Order/UpdateCart';
  final updateExtraItemQuantity = 'Customer/Order/UpdateExtraItemQuantity';
  final addToCart = 'Customer/Order/AddToCart';
  final addOrder = 'Customer/Order/AddOrder';
  final applyCoupon = 'Customer/Order/ApplyCoupon';



}

class _Catelog {
  const _Catelog();

  final getFavorite = "User/Catalog/GetFavorite";
  final addFavorite = "User/Catalog/AddToFavorite";
  final removeFavorite = "User/Catalog/RemoveFavorite";
}

class _Order {
  const _Order();







  final getAllOrders = 'Customer/Order/GetAllOrders';

  final getOrderDetails = 'Customer/Order/GetOrderDetails';

}

class _Profile {
  const _Profile();

  final getAllLocation = 'Customer/Address/GetAllAddress';
  final deleteLocation = 'Customer/Address/DeleteAddress';
  final logOut = 'Customer/Account/Logout';
  final addAddress = 'Customer/Address/AddAddress';
  final getAllCoupon = 'Customer/Coupon/GetAllCoupons';
  final updateLocation = 'Customer/Address/UpdateAddress';
  final getProfile = 'Customer/Account/GetUserProfile';
  final updateProfile = 'Customer/Account/UpdateProfile';
  final changeNumber = 'User/Account/ChnageNumberRequest';
  final updateNumber = 'User/Account/ChangeNumber';
}

class _Adress {
  const _Adress();

  final getAdress = 'Customer/Address/GetStreet';
}
