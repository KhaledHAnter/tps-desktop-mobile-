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

  /// `لاعبين مهتمين بالخدمة`
  String get home_cat2 {
    return Intl.message(
      'لاعبين مهتمين بالخدمة',
      name: 'home_cat2',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين تحت الاختبار`
  String get home_cat3 {
    return Intl.message(
      'لاعبين تحت الاختبار',
      name: 'home_cat3',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين مستنين البرنامج`
  String get home_cat4 {
    return Intl.message(
      'لاعبين مستنين البرنامج',
      name: 'home_cat4',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين اول 3 اسابيع`
  String get home_cat5 {
    return Intl.message(
      'لاعبين اول 3 اسابيع',
      name: 'home_cat5',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين اختبار ثاني`
  String get home_cat6 {
    return Intl.message(
      'لاعبين اختبار ثاني',
      name: 'home_cat6',
      desc: '',
      args: [],
    );
  }

  /// ` 2لاعبين مستنين البرنامج`
  String get home_cat7 {
    return Intl.message(
      ' 2لاعبين مستنين البرنامج',
      name: 'home_cat7',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين استلموا 6 اسابيع`
  String get home_cat8 {
    return Intl.message(
      'لاعبين استلموا 6 اسابيع',
      name: 'home_cat8',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين اخر اختبار`
  String get home_cat9 {
    return Intl.message(
      'لاعبين اخر اختبار',
      name: 'home_cat9',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين استلموا اخر اسابيع`
  String get home_cat10 {
    return Intl.message(
      'لاعبين استلموا اخر اسابيع',
      name: 'home_cat10',
      desc: '',
      args: [],
    );
  }

  /// `لاعبين انتهى اشتراكهم`
  String get home_cat11 {
    return Intl.message(
      'لاعبين انتهى اشتراكهم',
      name: 'home_cat11',
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

  /// `الأحدث`
  String get home_sort_cri1 {
    return Intl.message(
      'الأحدث',
      name: 'home_sort_cri1',
      desc: '',
      args: [],
    );
  }

  /// `سعر الاشتراك`
  String get home_sort_cri2 {
    return Intl.message(
      'سعر الاشتراك',
      name: 'home_sort_cri2',
      desc: '',
      args: [],
    );
  }

  /// `باقي المده`
  String get home_sort_cri3 {
    return Intl.message(
      'باقي المده',
      name: 'home_sort_cri3',
      desc: '',
      args: [],
    );
  }

  /// `الاسم`
  String get home_sort_cri4 {
    return Intl.message(
      'الاسم',
      name: 'home_sort_cri4',
      desc: '',
      args: [],
    );
  }

  /// `الرياضة`
  String get home_sort_cri5 {
    return Intl.message(
      'الرياضة',
      name: 'home_sort_cri5',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل اللاعب`
  String get details_head {
    return Intl.message(
      'تفاصيل اللاعب',
      name: 'details_head',
      desc: '',
      args: [],
    );
  }

  /// `قائمة التجميد للاعب`
  String get details_freeze {
    return Intl.message(
      'قائمة التجميد للاعب',
      name: 'details_freeze',
      desc: '',
      args: [],
    );
  }

  /// `لا يوجد سجل تجميد للاعب`
  String get details_no_freeze {
    return Intl.message(
      'لا يوجد سجل تجميد للاعب',
      name: 'details_no_freeze',
      desc: '',
      args: [],
    );
  }

  /// `تفاصيل عن اللاعب`
  String get details_desc {
    return Intl.message(
      'تفاصيل عن اللاعب',
      name: 'details_desc',
      desc: '',
      args: [],
    );
  }

  /// `لا توجد تفاصيل عن اللاعب`
  String get details_no_desc {
    return Intl.message(
      'لا توجد تفاصيل عن اللاعب',
      name: 'details_no_desc',
      desc: '',
      args: [],
    );
  }

  /// `تعديل اللاعب`
  String get edit_player {
    return Intl.message(
      'تعديل اللاعب',
      name: 'edit_player',
      desc: '',
      args: [],
    );
  }

  /// `تعديل اللاعب`
  String get edit_button_lbl {
    return Intl.message(
      'تعديل اللاعب',
      name: 'edit_button_lbl',
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
