// ignore_for_file: public_member_api_docs, sort_constructors_first

class SettingsStateRef {
  final String? locale;
  final bool? isLight;
  SettingsStateRef({this.locale, this.isLight});

  SettingsStateRef copyWith({
    String? locale,
    bool? isLight,
  }) {
    return SettingsStateRef(
        locale: locale ?? this.locale, isLight: isLight ?? this.isLight);
  }
}
