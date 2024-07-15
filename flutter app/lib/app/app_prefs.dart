import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/langauge_manager.dart';

const String prefKeyLang = "prefKeyLang";
const String onboardingViewed =
    "onboardingViewed";
const String userLogedIn = "userLogedIn";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefKeyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          prefKeyLang, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          prefKeyLang, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(onboardingViewed, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(onboardingViewed) ??
        false;
  }

  //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(userLogedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(userLogedIn) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(userLogedIn);
  }
}
