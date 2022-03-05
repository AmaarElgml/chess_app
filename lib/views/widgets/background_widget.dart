import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.2,
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(physics: NeverScrollableScrollPhysics(), children: [
              Container(child: Image.asset('assets/transperacy.png', fit: BoxFit.cover)),
              RotatedBox(
                  quarterTurns: 2, child: Container(child: Image.asset('assets/transperacy.png', fit: BoxFit.cover))),
              Container(child: Image.asset('assets/transperacy.png', fit: BoxFit.cover)),
            ])));
  }
}
