import 'player.dart';
import 'piece.dart';
import 'spot.dart';

class Move {
  Player player;
  Spot start;
  Spot end;
  Piece? pieceMoved;
  Piece? pieceKilled;
  bool castlingMove = false;

  Move(this.player, this.start, this.end) {
    this.pieceMoved = start.piece;
  }

  bool isCastlingMove() {
    return this.castlingMove;
  }

  void setCastlingMove(bool castlingMove) {
    this.castlingMove = castlingMove;
  }
}
