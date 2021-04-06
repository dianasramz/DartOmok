import 'ResponseParser.dart';

class WebClient{
  static const DEFAULT_SERVER = 'http//www.cs.utep.edu/cheon/project/omok';
  static const _INFO = '/info/';
  static const _NEW = '/new/';
  static const _PLAY = '/play/';
  static const _STRATEGY = 'strategy';
  static const _PID = 'pid';
  static const _MOVE = 'move';

  final String _authority;
  final String _path;

  final ResponseParser _responseParser = ResponseParser()

  /*
  final _serverUrl;
  WebClient(this._serverUrl);
  var parser = ResponseParser();
*/
  WebClient([baseUrl = DEFAULT_SERVER]):
      _authority = Uri.parse(baseUrl).authority,
      _path = Uri.parse(baseUrl).path;

  Info getInfo(){
    //TODO

    //return Info(15, <String>['Smart','Random']);
    return parser.parseInfo('[size: 15,...');
  }
}
