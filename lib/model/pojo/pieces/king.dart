import 'package:chess_app/model/pojo/board.dart';
import 'package:chess_app/model/pojo/piece.dart';
import 'package:chess_app/model/pojo/spot.dart';

class King extends Piece {
  King(this.white) : super(white);
  final bool white;

  @override
  String getIconPath() {
    String iconPath = white ? 'white_king' : 'black_king';
    return iconPath;
  }

  bool castled = false;

  @override
  bool canMove(Board board, Spot start, Spot end) {
    // we can't move the piece to a Spot that has a piece of the same color
    if (end.piece?.isWhite == this.isWhite) {
      return false;
    }

    int x = (start.x - end.x).abs();
    int y = (start.y - end.y).abs();
    if (x + y == 1) {
      // Todo
      // check if this move will not result in the king being attacked if so return true
      return true;
    }

    return this.isValidCastling(board, start, end);
  }

  bool isValidCastling(Board board, Spot start, Spot end) {
    // already castled
    if (this.castled) {
      return false;
    }

    // Todo
    // Logic for returning true or false
    return false;
  }

  bool isCastlingMove(Spot start, Spot end) {
    // Todo
    // check if the starting and ending position are correct
    return false;
  }
}
