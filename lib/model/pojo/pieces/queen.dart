import '../piece.dart';
import '../board.dart';
import '../spot.dart';

class Queen extends Piece {
  Queen(this.white) : super(white);
  final bool white;

  @override
  String getIconPath() {
    String iconPath = white ? 'white_queen' : 'black_queen';
    return iconPath;
  }

  @override
  bool canMove(Board board, Spot start, Spot end) {
    int x = (start.x - end.x).abs();
    int y = (start.y - end.y).abs();
    return x > 0 && y == 0 || y > 0 && x == 0 || x == y;
  }
}
