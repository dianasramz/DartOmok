import 'dart:io';
import 'Model.dart';

import 'WebClient.dart';

class Index{
  final int x;
  final int y;
  Index(this.x,this.y);
}


class ConsoleUI {


  var _board = Board(15, [0]);

  set board(Board board) => _board = board;

  void showMessage(msg) {
    stdout.writeln(msg);
  }


  void showBoard([int lastX, int lastY, Player lastMove]){
    var line = List<int>.generate(_board?.size,(i) => (i+1) % 10).join(' ');
    stdout.writeln('x $line');

    line = List<String>.generate(_board?.size, (i) => '__').join();
    stdout.writeln('y $line'); //separates lines

    var y = 0;
    for (var row in _board.rows){
      var currentRow = _board.rows;
      if(y == lastY){
        currentRow = List.from(row);
      }

      var line = currentRow.map((player) => player.stone).join(' ');
      y++;
      stdout.writeln('${y%10} | $line');
    }
  }

  promptServer(defaultUrl) {
    stdout.write('Enter the server URL [default: $defaultUrl]');
    //TODO prompt the user
    var url = Uri.parse(stdin.readLineSync());
    if (url.toString() == ' ') {
      return WebClient.DEFAULT_SERVER;
    }
  }

  promptStrategy(strategies) {
    stdout.writeln(
        'Select the server strategy (1. Smart | 2. Random) [default: Smart]');
    var selection = Uri.parse(stdin.readLineSync());
    if (selection.toString() == '') {
      return 'Smart';
    }
    if (selection.toString() == '1') {
      return 'Smart';
    }
    if (selection.toString() == '2') {
      return 'Random';
    }
  }

  Index _parseXY(String coords) {
    var split = coords.split(RegExp(r' *[|,] *'));
    if (split.length != 2) {
      throw FormatException();
    }
    var indexes = <int>[];
    for (var str in split) {
      var index = int.parse(str);
      if (index >= 1 && index <= 15) {
        indexes.add(index - 1);
      }
      else {
        throw FormatException();
      }
    }
    return Index(indexes[0], indexes[1]);
  }


  Index promptMove() {
    while (true) {
      print('Enter x and y (1-15, e.g., 8 10):');
      var coords = stdin.readLineSync().trim();
      try {
        var index = _parseXY(coords);
        if (_board.isEmpty(index.x, index.y)) {
          return index;
        }
        else {
          stdout.writeln('Not empty!');
          continue;
        }
      }
      on FormatException {}
      stdout.writeln('Invalid index!');
    }
  }

}

