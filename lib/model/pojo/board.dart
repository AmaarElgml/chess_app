import 'pieces/king.dart';
import 'pieces/queen.dart';
import 'pieces/rook.dart';
import 'pieces/knight.dart';
import 'pieces/bishop.dart';
import 'pieces/pawn.dart';
import 'package:chess_app/model/pojo/spot.dart';

class Board {
  Board() {
    resetBoard();
  }

  List<List<Spot>> boxes = [];

  Spot getBox(int x, int y) {
    if (x < 0 || x > 7 || y < 0 || y > 7) {
      throw Exception("Index out of bound");
    }

    return boxes[x][y];
  }

  void resetBoard() {
    // initialize white pieces
    boxes.add([
      Spot(0, 0, Rook(true)),
      Spot(0, 1, Knight(true)),
      Spot(0, 2, Bishop(true)),
      Spot(0, 3, King(true)),
      Spot(0, 4, Queen(true)),
      Spot(0, 5, Bishop(true)),
      Spot(0, 6, Knight(true)),
      Spot(0, 7, Rook(true)),
    ]);
    boxes.add([
      Spot(1, 0, Pawn(true)),
      Spot(1, 1, Pawn(true)),
      Spot(1, 2, Pawn(true)),
      Spot(1, 3, Pawn(true)),
      Spot(1, 4, Pawn(true)),
      Spot(1, 5, Pawn(true)),
      Spot(1, 6, Pawn(true)),
      Spot(1, 7, Pawn(true)),
    ]);

    // initialize remaining boxes without any piece
    for (int i = 2; i < 6; i++) {
      List<Spot> list = [];
      for (int j = 0; j < 8; j++) {
        list.add(Spot(i, j, null));
      }
      boxes.add(list);
    }

    boxes.add([
      Spot(6, 0, Pawn(false)),
      Spot(6, 1, Pawn(false)),
      Spot(6, 2, Pawn(false)),
      Spot(6, 3, Pawn(false)),
      Spot(6, 4, Pawn(false)),
      Spot(6, 5, Pawn(false)),
      Spot(6, 6, Pawn(false)),
      Spot(6, 7, Pawn(false)),
    ]);

    boxes.add([
      Spot(7, 0, Rook(false)),
      Spot(7, 1, Knight(false)),
      Spot(7, 2, Bishop(false)),
      Spot(7, 3, King(false)),
      Spot(7, 4, Queen(false)),
      Spot(7, 5, Bishop(false)),
      Spot(7, 6, Knight(false)),
      Spot(7, 7, Rook(false)),
    ]);
  }
}
