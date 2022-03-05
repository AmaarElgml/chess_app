import 'package:chess_app/viewmodels/game_viewmodel.dart';
import 'package:chess_app/views/widgets/player_model.dart';
import 'package:chess_app/views/widgets/spot_model.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  static String id = 'GamePage.id';

  @override
  _GamePageState createState() => _GamePageState();
  final bool againstComputer;

  GamePage({this.againstComputer = false});
}

class _GamePageState extends State<GamePage> {
  final GameViewModel viewModel = GameViewModel();

  List<Widget> allSpots = [];

  @override
  void initState() {
    viewModel.startGame(widget.againstComputer);
    getSpots();
    super.initState();
  }

  List<Widget> getSpots() {
    bool isRed = false;
    viewModel.getBoard().boxes.forEach((listOfSpots) {
      isRed = !isRed;
      listOfSpots.forEach((spot) {
        isRed = !isRed;
        setState(() {
          return allSpots.add(SpotModel(
              isRed: isRed,
              spot: spot,
              tapSpot: (spot) {
                viewModel.tapSpot(spot);
                setState(() {
                  getSpots();
                });
              }));
        });
      });
    });
    return allSpots;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Chess Game')),
        body: SafeArea(
            child: Container(
                child: Column(children: [
          Expanded(child: Center(child: PlayerModel(viewModel.newGame.players.first))),
          Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  child: GridView.count(crossAxisCount: 8, children: [...allSpots.reversed]),
                ),
              )),
          Expanded(child: Center(child: PlayerModel(viewModel.newGame.players.last))),
        ]))));
  }
}
