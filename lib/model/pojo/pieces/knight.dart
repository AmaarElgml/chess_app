import '../piece.dart';
import '../board.dart';
import '../spot.dart';

class Knight extends Piece {
  Knight(this.white) : super(white);

  final bool white;

  @override
  String getIconPath() {
    String iconPath = white ? 'white_knight' : 'black_knight';
    return iconPath;
  }

  @override
  bool canMove(Board board, Spot start, Spot end) {
    // we can't move the piece to a spot that has a piece of the same colour
    // if (end.piece != null) {
    //   if (end.piece?.isWhite == this.isWhite) {
    //     print('KNIGHT LOG: we can\'t move the piece to a spot that has a piece of the same colour');
    //     return false;
    //   }
    // }

    int x = (start.x - end.x).abs();
    int y = (start.y - end.y).abs();
    return x * y == 2;
  }
}
