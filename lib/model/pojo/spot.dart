import 'package:chess_app/model/pojo/piece.dart';

List<String> rowNames = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'];

class Spot {
  Piece? piece;
  int x;
  int y;

  Spot(this.x, this.y, this.piece);

  getSpotName() {
    return ('${this.x} ${this.y}');
  }
}
