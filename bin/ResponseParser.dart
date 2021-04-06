
class ResponseParser{
  Info parseInfo(String json){

    return Info(15, <String>['Smart', 'Random']);
  }
}

class Info {
  final size;
  var strategies;
  Info(this.size, this.strategies);

}