import '../piece.dart';
import '../board.dart';
import '../spot.dart';

class Pawn extends Piece {
  Pawn(this.white) : super(white);

  final bool white;

  @override
  String getIconPath() {
    String iconPath = white ? 'white_pawn' : 'black_pawn';
    return iconPath;
  }

  @override
  bool canMove(Board board, Spot start, Spot end) {
    int x = (end.x - start.x).abs();
    int y = (end.y - start.y).abs();

    // First move can skip 1 spot
    if (white && start.x == 1 && x == 2 && y == 0) return true;
    if (!white && start.x == 6 && x == 2 && y == 0) return true;
    // Normal Move
    if (x == 1 && y == 0) return true;

    // todo Take
    return false;
  }
}
