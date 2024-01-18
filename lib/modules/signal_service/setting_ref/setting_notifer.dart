// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:SFERA/utils/user_pref.dart';

// import 'setting_state_ref.dart';

// class SettingsNotifer extends StateNotifier<SettingsStateRef> {
//   SettingsNotifer()
//       : super(SettingsStateRef(
//             locale: UserPref.getLocale, isLight: UserPref.isLight));

//   void setLocale(Locale? locale) =>
//       state = state.copyWith(locale: UserPref.setLocale = locale!.languageCode);

//   void setDarkMode({bool isLight = false}) {
//     if (UserPref.isLight != isLight) {
//       state = state.copyWith(isLight: UserPref.isLight = isLight);
//     }
//   }
// }
