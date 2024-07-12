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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Password must be 6+`
  String get password_must_be_more {
    return Intl.message(
      'Password must be 6+',
      name: 'password_must_be_more',
      desc: '',
      args: [],
    );
  }

  /// `Must be a valid email`
  String get must_be_a_valid_email {
    return Intl.message(
      'Must be a valid email',
      name: 'must_be_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Must be a valid Phone Number with country code`
  String get must_be_a_valid_phone_number {
    return Intl.message(
      'Must be a valid Phone Number with country code',
      name: 'must_be_a_valid_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Have no account yet?`
  String get have_no_account_yet {
    return Intl.message(
      'Have no account yet?',
      name: 'have_no_account_yet',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_accountr {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_accountr',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `8-20 digits, At least 1 special characters 1 uppercase letter, with no continuous digits.`
  String get password_description {
    return Intl.message(
      '8-20 digits, At least 1 special characters 1 uppercase letter, with no continuous digits.',
      name: 'password_description',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `On Progress`
  String get on_progress {
    return Intl.message(
      'On Progress',
      name: 'on_progress',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Check`
  String get check {
    return Intl.message(
      'Check',
      name: 'check',
      desc: '',
      args: [],
    );
  }

  /// `Tracking`
  String get tracking {
    return Intl.message(
      'Tracking',
      name: 'tracking',
      desc: '',
      args: [],
    );
  }

  /// `Check Rates`
  String get check_rates {
    return Intl.message(
      'Check Rates',
      name: 'check_rates',
      desc: '',
      args: [],
    );
  }

  /// `Check Rate`
  String get check_rate {
    return Intl.message(
      'Check Rate',
      name: 'check_rate',
      desc: '',
      args: [],
    );
  }

  /// `History Tracking`
  String get history_tracking {
    return Intl.message(
      'History Tracking',
      name: 'history_tracking',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get see_all {
    return Intl.message(
      'See All',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `Input AWB Code here.`
  String get tracking_page_hintext {
    return Intl.message(
      'Input AWB Code here.',
      name: 'tracking_page_hintext',
      desc: '',
      args: [],
    );
  }

  /// `Origin`
  String get origin {
    return Intl.message(
      'Origin',
      name: 'origin',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Input origin location`
  String get input_origin_location {
    return Intl.message(
      'Input origin location',
      name: 'input_origin_location',
      desc: '',
      args: [],
    );
  }

  /// `Input destination location`
  String get input_destination_location {
    return Intl.message(
      'Input destination location',
      name: 'input_destination_location',
      desc: '',
      args: [],
    );
  }

  /// `Package Size`
  String get package_size {
    return Intl.message(
      'Package Size',
      name: 'package_size',
      desc: '',
      args: [],
    );
  }

  /// `Choose size`
  String get choose_size {
    return Intl.message(
      'Choose size',
      name: 'choose_size',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Cost`
  String get shipping_cost {
    return Intl.message(
      'Shipping Cost',
      name: 'shipping_cost',
      desc: '',
      args: [],
    );
  }

  /// `Create Shipment`
  String get create_shipment {
    return Intl.message(
      'Create Shipment',
      name: 'create_shipment',
      desc: '',
      args: [],
    );
  }

  /// `Create Shipment Now`
  String get create_shipment_now {
    return Intl.message(
      'Create Shipment Now',
      name: 'create_shipment_now',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `Set Estimate Time`
  String get set_estimated_time {
    return Intl.message(
      'Set Estimate Time',
      name: 'set_estimated_time',
      desc: '',
      args: [],
    );
  }

  /// `Arrival`
  String get arrival {
    return Intl.message(
      'Arrival',
      name: 'arrival',
      desc: '',
      args: [],
    );
  }

  /// `Edit Package Detail`
  String get edit_package_details {
    return Intl.message(
      'Edit Package Detail',
      name: 'edit_package_details',
      desc: '',
      args: [],
    );
  }

  /// `Highlights`
  String get highlights {
    return Intl.message(
      'Highlights',
      name: 'highlights',
      desc: '',
      args: [],
    );
  }

  /// `Special Promo`
  String get special_promo {
    return Intl.message(
      'Special Promo',
      name: 'special_promo',
      desc: '',
      args: [],
    );
  }

  /// `Account Balance`
  String get account_balance {
    return Intl.message(
      'Account Balance',
      name: 'account_balance',
      desc: '',
      args: [],
    );
  }

  /// `Top up`
  String get top_up {
    return Intl.message(
      'Top up',
      name: 'top_up',
      desc: '',
      args: [],
    );
  }

  /// `Top Up Balance`
  String get top_up_balance {
    return Intl.message(
      'Top Up Balance',
      name: 'top_up_balance',
      desc: '',
      args: [],
    );
  }

  /// `Enter Top up Amount`
  String get enter_top_up_amount {
    return Intl.message(
      'Enter Top up Amount',
      name: 'enter_top_up_amount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `MyCourier Balance`
  String get myCourier_balance {
    return Intl.message(
      'MyCourier Balance',
      name: 'myCourier_balance',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `How to Top up`
  String get how_to_top_up {
    return Intl.message(
      'How to Top up',
      name: 'how_to_top_up',
      desc: '',
      args: [],
    );
  }

  /// `Follow these steps bellow to top up your MyCourier Balance`
  String get folow_these_steps_to_top_up {
    return Intl.message(
      'Follow these steps bellow to top up your MyCourier Balance',
      name: 'folow_these_steps_to_top_up',
      desc: '',
      args: [],
    );
  }

  /// `Bank Virtual Account`
  String get bank_virtual_account {
    return Intl.message(
      'Bank Virtual Account',
      name: 'bank_virtual_account',
      desc: '',
      args: [],
    );
  }

  /// `My Rewards`
  String get my_rewards {
    return Intl.message(
      'My Rewards',
      name: 'my_rewards',
      desc: '',
      args: [],
    );
  }

  /// `Shipment`
  String get new_hipment {
    return Intl.message(
      'Shipment',
      name: 'new_hipment',
      desc: '',
      args: [],
    );
  }

  /// `About Sender`
  String get about_sender {
    return Intl.message(
      'About Sender',
      name: 'about_sender',
      desc: '',
      args: [],
    );
  }

  /// `Addres Additional Info`
  String get addres_additional_info {
    return Intl.message(
      'Addres Additional Info',
      name: 'addres_additional_info',
      desc: '',
      args: [],
    );
  }

  /// `Dropshipper`
  String get dropshipper {
    return Intl.message(
      'Dropshipper',
      name: 'dropshipper',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Pay Now`
  String get pay_now {
    return Intl.message(
      'Pay Now',
      name: 'pay_now',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Total Payment`
  String get total_payment {
    return Intl.message(
      'Total Payment',
      name: 'total_payment',
      desc: '',
      args: [],
    );
  }

  /// `I agree`
  String get i_agree {
    return Intl.message(
      'I agree',
      name: 'i_agree',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer`
  String get disclimer {
    return Intl.message(
      'Disclaimer',
      name: 'disclimer',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get large {
    return Intl.message(
      'Large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Extra Large`
  String get extra_large {
    return Intl.message(
      'Extra Large',
      name: 'extra_large',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Order ID`
  String get order_id {
    return Intl.message(
      'Order ID',
      name: 'order_id',
      desc: '',
      args: [],
    );
  }

  /// `Chapter with promo`
  String get chatper_with_promo {
    return Intl.message(
      'Chapter with promo',
      name: 'chatper_with_promo',
      desc: '',
      args: [],
    );
  }

  /// `Promo only available for MyCourier Balance`
  String get promo_only_available_on_donitaa_balanace {
    return Intl.message(
      'Promo only available for MyCourier Balance',
      name: 'promo_only_available_on_donitaa_balanace',
      desc: '',
      args: [],
    );
  }

  /// `Select Pickup Time`
  String get select_pickup_time {
    return Intl.message(
      'Select Pickup Time',
      name: 'select_pickup_time',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get select_payment_method {
    return Intl.message(
      'Select Payment Method',
      name: 'select_payment_method',
      desc: '',
      args: [],
    );
  }

  /// `e-Wallet`
  String get e_wallet {
    return Intl.message(
      'e-Wallet',
      name: 'e_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Cash On Pickup`
  String get cash_on_pickup {
    return Intl.message(
      'Cash On Pickup',
      name: 'cash_on_pickup',
      desc: '',
      args: [],
    );
  }

  /// `Package Details`
  String get package_details {
    return Intl.message(
      'Package Details',
      name: 'package_details',
      desc: '',
      args: [],
    );
  }

  /// `Item Details`
  String get item_details {
    return Intl.message(
      'Item Details',
      name: 'item_details',
      desc: '',
      args: [],
    );
  }

  /// `Frozen Food`
  String get frozen_food {
    return Intl.message(
      'Frozen Food',
      name: 'frozen_food',
      desc: '',
      args: [],
    );
  }

  /// `Non-perishable Food & Snack`
  String get non_perishable_food_and_snack {
    return Intl.message(
      'Non-perishable Food & Snack',
      name: 'non_perishable_food_and_snack',
      desc: '',
      args: [],
    );
  }

  /// `Fragile Item`
  String get fragile_item {
    return Intl.message(
      'Fragile Item',
      name: 'fragile_item',
      desc: '',
      args: [],
    );
  }

  /// `Extra Packaging`
  String get extra_packaging {
    return Intl.message(
      'Extra Packaging',
      name: 'extra_packaging',
      desc: '',
      args: [],
    );
  }

  /// `Additional Insurance`
  String get additional_insurance {
    return Intl.message(
      'Additional Insurance',
      name: 'additional_insurance',
      desc: '',
      args: [],
    );
  }

  /// `to use Donitaa Services Agreement.`
  String get to_use_donitaa_services_agreement {
    return Intl.message(
      'to use Donitaa Services Agreement.',
      name: 'to_use_donitaa_services_agreement',
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
