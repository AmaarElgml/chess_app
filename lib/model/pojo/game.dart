import 'piece.dart';
import 'player.dart';
import 'board.dart';
import 'move.dart';
import 'spot.dart';
import 'pieces/king.dart';

enum GameStatus { ACTIVE, BLACK_WIN, WHITE_WIN, FORFEIT, STALEMATE, RESIGNATION }

class Game {
  List<Player> players = [];
  Board board = Board();
  late Player currentTurn;
  late GameStatus status;
  late List<Move> movesPlayed = [];

  void initialize(Player p1, Player p2) {
    players.add(p1);
    players.add(p2);

    board.resetBoard();

    if (p1.whiteSide) {
      this.currentTurn = p1;
    } else {
      this.currentTurn = p2;
    }

    movesPlayed.clear();
  }

  bool isEnd() {
    return this.status != GameStatus.ACTIVE;
  }

  bool playerMove(Player player, int startX, int startY, int endX, int endY) {
    Spot startBox = board.getBox(startX, startY);
    Spot endBox = board.getBox(endX, endY);
    Move move = Move(player, startBox, endBox);
    return this.makeMove(move, player);
  }

  bool makeMove(Move move, Player player) {
    Piece? sourcePiece = move.start.piece;
    if (sourcePiece == null) {
      print('GAME LOG: Source is null');
      return false;
    }

    // valid player
    if (player != currentTurn) {
      print('GAME LOG: not your turn');
      return false;
    }

    if (sourcePiece.isWhite != player.whiteSide) {
      print('GAME LOG: not your piece');
      return false;
    }

    // valid move?
    if (!sourcePiece.canMove(board, move.start, move.end)) {
      print('GAME LOG: not move of this piece');
      return false;
    }

    // kill?
    Piece? destPiece = move.end.piece;
    if (destPiece != null) {
      destPiece.isKilled = true;
      move.pieceKilled = destPiece;
    }

    // castling?
    if (sourcePiece != null && sourcePiece is King && sourcePiece.isCastlingMove(move.start, move.end)) {
      move.castlingMove = true;
    }

    // store the move
    movesPlayed.add(move);

    // move piece from the start box to end box
    move.end.piece = move.start.piece;
    move.start.piece = null;

    if (destPiece != null && destPiece is King) {
      if (player.whiteSide) {
        this.status = GameStatus.WHITE_WIN;
      } else {
        this.status = GameStatus.BLACK_WIN;
      }
    }

    // set the current turn to the other player
    if (this.currentTurn == players[0]) {
      this.currentTurn = players[1];
    } else {
      this.currentTurn = players[0];
    }

    board.boxes.forEach((listOfSpots) {
      listOfSpots.forEach((spot) {
        if (spot.x == move.start.x && spot.y == move.start.y) {
          spot.piece = null;
        }
        if (spot.x == move.end.x && spot.y == move.end.y) {
          spot.piece = sourcePiece;
        }
      });
    });

    return true;
  }
}
