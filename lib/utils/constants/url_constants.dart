class UrlConstants {
  static final UrlConstants instanse = UrlConstants();

  late final String _restUrl;
  UrlConstants() {
    _restUrl = "https://rickandmortyapi.com/api";
  }

  String get restUrl => _restUrl;
}
