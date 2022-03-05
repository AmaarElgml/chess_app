import 'package:chess_app/views/widgets/background_widget.dart';
import 'package:flutter/material.dart';
import '../../../app_theme.dart';
import '../game/game_page.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage.id';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BackgroundWidget(),
      Padding(
        padding: EdgeInsets.all(defSpacing * 2),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    navigateTo(context, GamePage(againstComputer: true));
                  },
                  child: Text('Play Computer')),
              SizedBox(height: defSpacing),
              ElevatedButton(
                  onPressed: () {
                    navigateTo(context, GamePage(againstComputer: false));
                  },
                  child: Text('2 Players')),
              SizedBox(height: defSpacing),
              ElevatedButton(onPressed: () {}, child: Text('Challenge a friend')),
            ]),
      ),
    ]);
  }

  navigateTo(context, page) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
