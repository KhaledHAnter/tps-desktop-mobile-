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

  /// `Hello Captain Taha`
  String get home_hi {
    return Intl.message(
      'Hello Captain Taha',
      name: 'home_hi',
      desc: '',
      args: [],
    );
  }

  /// `Happy to see you again`
  String get home_subHi {
    return Intl.message(
      'Happy to see you again',
      name: 'home_subHi',
      desc: '',
      args: [],
    );
  }

  /// `Searching for nearby clubs...`
  String get home_search {
    return Intl.message(
      'Searching for nearby clubs...',
      name: 'home_search',
      desc: '',
      args: [],
    );
  }

  /// `What would you like to use today`
  String get home_title {
    return Intl.message(
      'What would you like to use today',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `اجمالي اللاعبين`
  String get home_cat1 {
    return Intl.message(
      'اجمالي اللاعبين',
      name: 'home_cat1',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين تحت الاختبار`
  String get home_cat2 {
    return Intl.message(
      'لاعبين تحت الاختبار',
      name: 'home_cat2',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين مرحله اولى`
  String get home_cat3 {
    return Intl.message(
      'لاعبين مرحله اولى',
      name: 'home_cat3',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين اختبار ثاني`
  String get home_cat4 {
    return Intl.message(
      'لاعبين اختبار ثاني',
      name: 'home_cat4',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين مرحله ثانيه`
  String get home_cat5 {
    return Intl.message(
      'لاعبين مرحله ثانيه',
      name: 'home_cat5',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين انتهى اشتراكهم`
  String get home_cat6 {
    return Intl.message(
      'لاعبين انتهى اشتراكهم',
      name: 'home_cat6',
      desc: '',
      args: [],
    );
  }

  /// `إضافة لاعب جديد`
  String get home_add_player {
    return Intl.message(
      'إضافة لاعب جديد',
      name: 'home_add_player',
      desc: '',
      args: [],
    );
  }

  /// `اسم اللاعب`
  String get home_add_lbl1 {
    return Intl.message(
      'اسم اللاعب',
      name: 'home_add_lbl1',
      desc: '',
      args: [],
    );
  }

  /// `الرياضة`
  String get home_add_lbl2 {
    return Intl.message(
      'الرياضة',
      name: 'home_add_lbl2',
      desc: '',
      args: [],
    );
  }

  /// `فترة التدريب`
  String get home_add_lbl3 {
    return Intl.message(
      'فترة التدريب',
      name: 'home_add_lbl3',
      desc: '',
      args: [],
    );
  }

  /// `سعر الاشتراك`
  String get home_add_lbl4 {
    return Intl.message(
      'سعر الاشتراك',
      name: 'home_add_lbl4',
      desc: '',
      args: [],
    );
  }

  /// `رقم التلفون`
  String get home_add_lbl5 {
    return Intl.message(
      'رقم التلفون',
      name: 'home_add_lbl5',
      desc: '',
      args: [],
    );
  }

  /// `ملاحظات`
  String get home_add_lbl6 {
    return Intl.message(
      'ملاحظات',
      name: 'home_add_lbl6',
      desc: '',
      args: [],
    );
  }

  /// `إضافة اللاعب`
  String get home_add_action {
    return Intl.message(
      'إضافة اللاعب',
      name: 'home_add_action',
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
