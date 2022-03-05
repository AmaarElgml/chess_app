import '../piece.dart';
import '../board.dart';
import '../spot.dart';

class Bishop extends Piece {
  Bishop(this.white) : super(white);
  final bool white;

  @override
  String getIconPath() {
    String iconPath = white ? 'white_bishop' : 'black_bishop';
    return iconPath;
  }

  @override
  bool canMove(Board board, Spot start, Spot end) {
    int x = (start.x - end.x).abs();
    int y = (start.y - end.y).abs();
    return x == y;
  }
}
