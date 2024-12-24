// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// ``
  String get ____________________________profile_screen_______________________ {
    return Intl.message(
      '',
      name: '____________________________profile_screen_______________________',
      desc: '',
      args: [],
    );
  }

  /// `Do you really want to logout?`
  String get D {
    return Intl.message(
      'Do you really want to logout?',
      name: 'D',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get Confirm {
    return Intl.message(
      'Confirm',
      name: 'Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Completed {value}`
  String Completed_va(Object value) {
    return Intl.message(
      'Completed $value',
      name: 'Completed_va',
      desc: '',
      args: [value],
    );
  }

  /// `My Account`
  String get My_account {
    return Intl.message(
      'My Account',
      name: 'My_account',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get MyOrder {
    return Intl.message(
      'My Orders',
      name: 'MyOrder',
      desc: '',
      args: [],
    );
  }

  /// `My Addresses`
  String get MyAddress {
    return Intl.message(
      'My Addresses',
      name: 'MyAddress',
      desc: '',
      args: [],
    );
  }

  /// `My Coupons`
  String get MyCoupons {
    return Intl.message(
      'My Coupons',
      name: 'MyCoupons',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get GeneralSetting {
    return Intl.message(
      'General Settings',
      name: 'GeneralSetting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notification {
    return Intl.message(
      'Notifications',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `User Information`
  String get UserInformation {
    return Intl.message(
      'User Information',
      name: 'UserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get AboutApp {
    return Intl.message(
      'About App',
      name: 'AboutApp',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get AddNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'AddNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Add New Coupon`
  String get AddNewCoupon {
    return Intl.message(
      'Add New Coupon',
      name: 'AddNewCoupon',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Female {
    return Intl.message(
      'Female',
      name: 'Female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Male {
    return Intl.message(
      'Male',
      name: 'Male',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get MobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'MobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Location Details`
  String get DetailsLocation {
    return Intl.message(
      'Location Details',
      name: 'DetailsLocation',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message(
      'Title',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get Floor {
    return Intl.message(
      'Floor',
      name: 'Floor',
      desc: '',
      args: [],
    );
  }

  /// `Additional Details`
  String get AdditionalDetails {
    return Intl.message(
      'Additional Details',
      name: 'AdditionalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Activate Coupons`
  String get ActivateCoupons {
    return Intl.message(
      'Activate Coupons',
      name: 'ActivateCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Previous Coupons`
  String get PreviousCoupons {
    return Intl.message(
      'Previous Coupons',
      name: 'PreviousCoupons',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Order food wherever you are through the FID application`
  String get TextAboutApplication {
    return Intl.message(
      'Order food wherever you are through the FID application',
      name: 'TextAboutApplication',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ____________________________order_screen_______________________ {
    return Intl.message(
      '',
      name: '____________________________order_screen_______________________',
      desc: '',
      args: [],
    );
  }

  /// `Active Orders`
  String get Active_order {
    return Intl.message(
      'Active Orders',
      name: 'Active_order',
      desc: '',
      args: [],
    );
  }

  /// `Previous Orders`
  String get Previous_order {
    return Intl.message(
      'Previous Orders',
      name: 'Previous_order',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get My_order {
    return Intl.message(
      'My Orders',
      name: 'My_order',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get Order_details {
    return Intl.message(
      'Order Details',
      name: 'Order_details',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Search by Order Number`
  String get Search_by_order_number {
    return Intl.message(
      'Search by Order Number',
      name: 'Search_by_order_number',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get Pending {
    return Intl.message(
      'Pending',
      name: 'Pending',
      desc: '',
      args: [],
    );
  }

  /// `Order Number: `
  String get Order_number {
    return Intl.message(
      'Order Number: ',
      name: 'Order_number',
      desc: '',
      args: [],
    );
  }

  /// `Order Status: `
  String get Order_status {
    return Intl.message(
      'Order Status: ',
      name: 'Order_status',
      desc: '',
      args: [],
    );
  }

  /// `Order Date: `
  String get Order_date {
    return Intl.message(
      'Order Date: ',
      name: 'Order_date',
      desc: '',
      args: [],
    );
  }

  /// `Expected Delivery Time: `
  String get The_Expected_Time_For_The_order_to_arrive {
    return Intl.message(
      'Expected Delivery Time: ',
      name: 'The_Expected_Time_For_The_order_to_arrive',
      desc: '',
      args: [],
    );
  }

  /// `Count:`
  String get Count {
    return Intl.message(
      'Count:',
      name: 'Count',
      desc: '',
      args: [],
    );
  }

  /// ` Total price: `
  String get Price_order {
    return Intl.message(
      ' Total price: ',
      name: 'Price_order',
      desc: '',
      args: [],
    );
  }

  /// `Recipient Information`
  String get Recipient_info {
    return Intl.message(
      'Recipient Information',
      name: 'Recipient_info',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Phone {
    return Intl.message(
      'Phone',
      name: 'Phone',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to`
  String get Arrive_to {
    return Intl.message(
      'Deliver to',
      name: 'Arrive_to',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get Accept {
    return Intl.message(
      'Accept',
      name: 'Accept',
      desc: '',
      args: [],
    );
  }

  /// `DriverAccept`
  String get Driver_Accept {
    return Intl.message(
      'DriverAccept',
      name: 'Driver_Accept',
      desc: '',
      args: [],
    );
  }

  /// `OnTheWay`
  String get On_The_Way {
    return Intl.message(
      'OnTheWay',
      name: 'On_The_Way',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get Rejected {
    return Intl.message(
      'Rejected',
      name: 'Rejected',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get Completed {
    return Intl.message(
      'Completed',
      name: 'Completed',
      desc: '',
      args: [],
    );
  }

  /// `Valid until the end`
  String get ValidUntilTheEnd {
    return Intl.message(
      'Valid until the end',
      name: 'ValidUntilTheEnd',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ____________________________cart_screen_______________________ {
    return Intl.message(
      '',
      name: '____________________________cart_screen_______________________',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Place Order`
  String get Send_the_request {
    return Intl.message(
      'Place Order',
      name: 'Send_the_request',
      desc: '',
      args: [],
    );
  }

  /// `Choose Saved Location`
  String get Choose_a_saved_address {
    return Intl.message(
      'Choose Saved Location',
      name: 'Choose_a_saved_address',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get Add_a_new_address {
    return Intl.message(
      'Add New Address',
      name: 'Add_a_new_address',
      desc: '',
      args: [],
    );
  }

  /// `Choose Saved Coupon`
  String get Choose_a_saved_coupon {
    return Intl.message(
      'Choose Saved Coupon',
      name: 'Choose_a_saved_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Add New Coupon`
  String get Add_a_new_coupon {
    return Intl.message(
      'Add New Coupon',
      name: 'Add_a_new_coupon',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get Application {
    return Intl.message(
      'Application',
      name: 'Application',
      desc: '',
      args: [],
    );
  }

  /// `Cancel code`
  String get Cancel_code {
    return Intl.message(
      'Cancel code',
      name: 'Cancel_code',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Code`
  String get Coupon_code {
    return Intl.message(
      'Coupon Code',
      name: 'Coupon_code',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `Neighborhood`
  String get Neighborhood {
    return Intl.message(
      'Neighborhood',
      name: 'Neighborhood',
      desc: '',
      args: [],
    );
  }

  /// `Region`
  String get Region {
    return Intl.message(
      'Region',
      name: 'Region',
      desc: '',
      args: [],
    );
  }

  /// `Near`
  String get NearTo {
    return Intl.message(
      'Near',
      name: 'NearTo',
      desc: '',
      args: [],
    );
  }

  /// `Choose Location from Map`
  String get Choose_a_address_from_the_map {
    return Intl.message(
      'Choose Location from Map',
      name: 'Choose_a_address_from_the_map',
      desc: '',
      args: [],
    );
  }

  /// `Your Selected Location`
  String get Your_selected_location {
    return Intl.message(
      'Your Selected Location',
      name: 'Your_selected_location',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get Add {
    return Intl.message(
      'Add',
      name: 'Add',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get Select {
    return Intl.message(
      'Select',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Price`
  String get Delivery_price {
    return Intl.message(
      'Delivery Price',
      name: 'Delivery_price',
      desc: '',
      args: [],
    );
  }

  /// `Coupon Value`
  String get Coupon_value {
    return Intl.message(
      'Coupon Value',
      name: 'Coupon_value',
      desc: '',
      args: [],
    );
  }

  /// `Total Price After Discount`
  String get Total_price_after_discount {
    return Intl.message(
      'Total Price After Discount',
      name: 'Total_price_after_discount',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get Total_price {
    return Intl.message(
      'Total Price',
      name: 'Total_price',
      desc: '',
      args: [],
    );
  }

  /// `Price All`
  String get Price_all {
    return Intl.message(
      'Price All',
      name: 'Price_all',
      desc: '',
      args: [],
    );
  }

  /// `SP`
  String get Currency {
    return Intl.message(
      'SP',
      name: 'Currency',
      desc: '',
      args: [],
    );
  }

  /// `Other additions to the order`
  String get add_extra_item {
    return Intl.message(
      'Other additions to the order',
      name: 'add_extra_item',
      desc: '',
      args: [],
    );
  }

  /// `The location has been selected`
  String get The_location_has_been_selected {
    return Intl.message(
      'The location has been selected',
      name: 'The_location_has_been_selected',
      desc: '',
      args: [],
    );
  }

  /// `The application was successful `
  String get The_application_was_successful {
    return Intl.message(
      'The application was successful ',
      name: 'The_application_was_successful',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '----------------------------home_screen-----------------------' key

  /// `No Offers Found`
  String get notFoundOffer {
    return Intl.message(
      'No Offers Found',
      name: 'notFoundOffer',
      desc: '',
      args: [],
    );
  }

  /// `Order your favorite food and meals now through our app`
  String get title_home {
    return Intl.message(
      'Order your favorite food and meals now through our app',
      name: 'title_home',
      desc: '',
      args: [],
    );
  }

  /// `Recently Added Products`
  String get recently_added_products {
    return Intl.message(
      'Recently Added Products',
      name: 'recently_added_products',
      desc: '',
      args: [],
    );
  }

  /// `Our Offers`
  String get offers {
    return Intl.message(
      'Our Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Successfully added`
  String get successfully_added {
    return Intl.message(
      'Successfully added',
      name: 'successfully_added',
      desc: '',
      args: [],
    );
  }

  /// `Number increased`
  String get number_increased {
    return Intl.message(
      'Number increased',
      name: 'number_increased',
      desc: '',
      args: [],
    );
  }

  /// `see all`
  String get see_all {
    return Intl.message(
      'see all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '---------------------------details_product_screen-------------------' key

  /// `Product Details`
  String get details_product {
    return Intl.message(
      'Product Details',
      name: 'details_product',
      desc: '',
      args: [],
    );
  }

  /// `selected`
  String get selected {
    return Intl.message(
      'selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get confirm {
    return Intl.message(
      'confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '---------------------------all_food_screen------------------------' key

  /// `All Foods`
  String get all_food {
    return Intl.message(
      'All Foods',
      name: 'all_food',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '----------------------------error-----------------------' key

  /// `Something went wrong, please try again`
  String get Something_went_wrong_please_try_again {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'Something_went_wrong_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Location service on the device is disabled`
  String get Location_service_on_the_device_is_disabled {
    return Intl.message(
      'Location service on the device is disabled',
      name: 'Location_service_on_the_device_is_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Location permission is not granted`
  String get Location_permission_is_not_granted {
    return Intl.message(
      'Location permission is not granted',
      name: 'Location_permission_is_not_granted',
      desc: '',
      args: [],
    );
  }

  /// `Turn on location service to allow`
  String get Turn_on_location_service_to_allow {
    return Intl.message(
      'Turn on location service to allow',
      name: 'Turn_on_location_service_to_allow',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the '---------------------------Auth_feature-------------------' key

  /// `Restaurant application`
  String get Restaurant_application {
    return Intl.message(
      'Restaurant application',
      name: 'Restaurant_application',
      desc: '',
      args: [],
    );
  }

  /// `For fast food`
  String get For_fast_food {
    return Intl.message(
      'For fast food',
      name: 'For_fast_food',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get Sign_in_with_Google {
    return Intl.message(
      'Sign in with Google',
      name: 'Sign_in_with_Google',
      desc: '',
      args: [],
    );
  }

  /// `Sing In`
  String get sing_in {
    return Intl.message(
      'Sing In',
      name: 'sing_in',
      desc: '',
      args: [],
    );
  }

  /// `Locate`
  String get Locate {
    return Intl.message(
      'Locate',
      name: 'Locate',
      desc: '',
      args: [],
    );
  }

  /// `Allow the app to determine your current location to provide better service`
  String get Allow_the_app_to_determine_your_current_location {
    return Intl.message(
      'Allow the app to determine your current location to provide better service',
      name: 'Allow_the_app_to_determine_your_current_location',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Browse and order all products at any time`
  String get Browse_and_order_all_products_at_any_time {
    return Intl.message(
      'Browse and order all products at any time',
      name: 'Browse_and_order_all_products_at_any_time',
      desc: '',
      args: [],
    );
  }

  /// `Track your delivery in real time`
  String get Track_your_delivery_in_real_time {
    return Intl.message(
      'Track your delivery in real time',
      name: 'Track_your_delivery_in_real_time',
      desc: '',
      args: [],
    );
  }

  /// `Track your order until it reaches you`
  String get Track_your_order_until_it_reaches_you {
    return Intl.message(
      'Track your order until it reaches you',
      name: 'Track_your_order_until_it_reaches_you',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get This_field_is_required {
    return Intl.message(
      'This field is required',
      name: 'This_field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `select`
  String get select {
    return Intl.message(
      'select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Log in to browse`
  String get Log_in_to_browse {
    return Intl.message(
      'Log in to browse',
      name: 'Log_in_to_browse',
      desc: '',
      args: [],
    );
  }

  /// `You must log in`
  String get You_must_log_in {
    return Intl.message(
      'You must log in',
      name: 'You_must_log_in',
      desc: '',
      args: [],
    );
  }

  /// ``
  String
      get ____________________________notification_screen_______________________ {
    return Intl.message(
      '',
      name:
          '____________________________notification_screen_______________________',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get Filter {
    return Intl.message(
      'Filter',
      name: 'Filter',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications`
  String get No_Notifications {
    return Intl.message(
      'No Notifications',
      name: 'No_Notifications',
      desc: '',
      args: [],
    );
  }

  /// `A new coupon has been added`
  String get New_Coupon_Added {
    return Intl.message(
      'A new coupon has been added',
      name: 'New_Coupon_Added',
      desc: '',
      args: [],
    );
  }

  /// `You have a new order`
  String get You_Have_A_New_Order {
    return Intl.message(
      'You have a new order',
      name: 'You_Have_A_New_Order',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
