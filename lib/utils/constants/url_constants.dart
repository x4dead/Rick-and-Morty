// enum ServerEnum { test, core, stage, serverDown }

///
///serverDown, когда ломается stage
///Работает только с VPN
///

//Change Server
// const ServerEnum nameServer = ServerEnum.stage;

class UrlConstants {
  static final UrlConstants instanse = UrlConstants();

  // late final String _grpcUrl;
  late final String _restUrl;
  // late final String _sendbirdApiToken;
  // late final int _portOldGrpc;
  // late final int _portNewGrpc;
  // late final String _clientCrt;
  // late final String _clientKey;
  // late final String _serverCrt;
  // late final String _openViduUrl;
  UrlConstants() {
    // switch (nameServer) {
    //   case ServerEnum.core:
    //     _clientCrt = clientCrtCore;
    //     _clientKey = clientKeyCore;
    //     _serverCrt = serverCrtCore;
    //     _grpcUrl = "asap.sfera-app.net";
        _restUrl = "https://rickandmortyapi.com/api";
      //   _openViduUrl = "wss://ov.core.sfera-app.net";
      //   _sendbirdApiToken =
      //       "MDZiZTgyYTgxMWY0ZTI4ZTU3YTgxMzM4ODQwN2ZlYzg3ZWJlNjJiMw==";
      //   _portNewGrpc = 30135;
      //   _portOldGrpc = 30130;
      //   break;
      // case ServerEnum.test:
      //   _clientCrt = clientCrtTest;
      //   _clientKey = clientKeyTest;
      //   _serverCrt = serverCrtTest;
      //   _grpcUrl = "asap.test.sfera-app.net";
      //   _restUrl = "https://test.sfera-app.net";
      //   _openViduUrl = "wss://ov.test.sfera-app.net";
      //   _portNewGrpc = 30165;
      //   _portOldGrpc = 30141;
      //   break;
      // case ServerEnum.stage:
      //   _clientCrt = clientCrtStage;
      //   _clientKey = clientKeyStage;
      //   _serverCrt = serverCrtStage;
      //   _grpcUrl = "asap.stage.sfera-app.net";
      //   _restUrl = "https://stage.sfera-app.net";
      //   _openViduUrl = "wss://ov.stage.sfera-app.net";
      //   _portNewGrpc = 30146;
      //   _portOldGrpc = 30141;
      //   break;
      // case ServerEnum.serverDown:
      //   _grpcUrl = "10.250.1.220";
      //   _restUrl = "https://stage.sfera-app.net";

      //   _portNewGrpc = 30146;
      //   _portOldGrpc = 30141;
      //   break;
      // default:
    // }
  }

  // String get clientCrt => _clientCrt;
  // String get clientKey => _clientKey;
  // String get serverCrt => _serverCrt;
  // String get grpcUrl => _grpcUrl;
  String get restUrl => _restUrl;
  // String get openViduUrl => _openViduUrl;
  // String get sendbirdApiToken => _sendbirdApiToken;
  // int get portNewGrpc => _portNewGrpc;
  // int get portOldGrpc => _portOldGrpc;
}
