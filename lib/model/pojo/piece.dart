import 'board.dart';
import 'spot.dart';

abstract class Piece {
  Piece(this.isWhite);

  bool canMove(Board board, Spot start, Spot end);

  String getIconPath();

  bool isKilled = false;
  bool isWhite = false;
  var currentPosition;
  var possibleMoves;
}
