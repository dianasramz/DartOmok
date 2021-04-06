import 'WebClient.dart';
import 'package:DartOmok/DartOmok.dart';
import 'dart:io';
import 'ConsoleUI.dart';

class Controller{
  void start(){
    var ui = ConsoleUI();
    ui.showMessage(('Welcome to Omok!'));
    var server = ui.promptServer(WebClient.DEFAULT_SERVER);
    ui.showMessage('obtaining server information...');
    var web = WebClient(server);
    var info = web.getInfo();
    print('Size: ');
    print(info.size);
    var strategy = ui.promptStrategy(info.strategies);
    print(strategy);
    ui.showBoard(0,0);

    //ui.promptMove();

  }
}
