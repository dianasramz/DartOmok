class Model{

}

class Player{

  final String stone;

  Player(this.stone);

  @override
  String toString() => stone;

}

class Board{


  final int size;
  static final _WIN = Player('W');
  final _emptySpot;

  final List<List<Player>> _places;



  Board(this.size, [this._emptySpot]):
        _places = List.generate(size,(i) => List.filled(size, _emptySpot), growable: false);


  List<Player> row(int x) {
    return _places[x];
  }

  List<List<Player>> get rows => _places;

  bool isEmpty(x,y){
    return _places[x][y] == _emptySpot;
  }

  void placeStone(Player player, int x, int y){
    if(_places[x][y] == _emptySpot){
      _places[y][x] = player;
      return;
    }
  }

  void setWinningRow(List<int> row){
    for(var i = 0; i<row.length; i+=2){
      _places[row[i+1]][row[i]] = _WIN;
    }

    @override
    String toString() => _places.toString();
  }



}

