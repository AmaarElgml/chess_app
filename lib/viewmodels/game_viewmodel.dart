import 'package:chess_app/model/pojo/board.dart';
import 'package:chess_app/model/pojo/game.dart';
import 'package:chess_app/model/pojo/player.dart';
import 'package:chess_app/model/pojo/spot.dart';

class GameViewModel {
  Player player1 = ComputerPlayer(false, 1395);

  Game newGame = Game();
  bool first = true;
  late Spot firstSpot;
  late Spot secSpot;

  Board getBoard() {
    return newGame.board;
  }

  startGame(againstComputer) {
    newGame.initialize(againstComputer ? ComputerPlayer(false, 1395) : HumanPlayer(true, 1380, 'Ahmed'),
        HumanPlayer(true, 1400, 'Ammar'));
  }

  tapSpot(Spot spot) {
    print('LOG: tapSpot');
    if (first) {
      print('LOG: first');
      firstSpot = spot;
      first = false;
    } else {
      print('LOG: second');
      secSpot = spot;
      first = true;
      move(newGame.currentTurn, firstSpot, secSpot);
    }
  }

  move(player, Spot firstSpot, Spot secSpot) {
    print('LOG: move');
    newGame.playerMove(player, firstSpot.x, firstSpot.y, secSpot.x, secSpot.y);
  }
}
