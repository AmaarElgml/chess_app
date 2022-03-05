import 'package:chess_app/model/pojo/player.dart';
import 'package:flutter/material.dart';

class PlayerModel extends StatelessWidget {
  PlayerModel(this.player);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
            title: Text('${player.name} (${player.rating})', style: TextStyle(color: Colors.white)),
            leading: Image.asset(player.image!, width: 40, height: 40),
            trailing: ElevatedButton(
                onPressed: null,
                child: TweenAnimationBuilder(
                    duration: Duration(minutes: 10),
                    tween: Tween<Duration>(begin: Duration(minutes: 10), end: Duration.zero),
                    builder: (context, Duration value, child) {
                      return Text('${value.inMinutes} : ${value.inSeconds % 60}', style: TextStyle(color: Colors.grey));
                    })),
            contentPadding: EdgeInsets.zero));
  }
//
// getTime() {
//   playerTimer = Timer.periodic(Duration(minutes: 9, seconds: 59), (timer) {
//     if (player2TimeSec == 0) {
//       playerTimer.cancel();
//       // status = GameStatus.BLACK_WIN;
//     } else {
//       player2TimeSec--;
//     }
//   });
// }
}
