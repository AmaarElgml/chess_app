import 'package:chess_app/model/pojo/pieces/pawn.dart';
import 'package:chess_app/model/pojo/spot.dart';
import 'package:flutter/material.dart';

import '../../app_theme.dart';

class SpotModel extends StatelessWidget {
  SpotModel({required this.isRed, required this.spot, required this.tapSpot});

  final bool isRed;
  final Spot spot;
  final Function tapSpot;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          tapOnSpot(spot);
        },
        child: Container(
            padding: EdgeInsets.all(spot.piece is Pawn ? 8 : 4),
            decoration: BoxDecoration(
                color: isRed ? Colors.deepOrange.withOpacity(0.8) : primaryColor.withOpacity(0.8),
                shape: BoxShape.rectangle),
            child: spot.piece != null
                ? Opacity(
                    opacity: 0.7,
                    child: Image.asset('assets/chess_pieces/${spot.piece?.getIconPath()}.png', fit: BoxFit.fitHeight))
                : SizedBox()));
  }

  tapOnSpot(Spot currentSpot) {
    print('SpotOnTapped: \nPiece: ${currentSpot.piece}\nx: ${currentSpot.x}\ny: ${currentSpot.y}');
    tapSpot(currentSpot);
  }
}
