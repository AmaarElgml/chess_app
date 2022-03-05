import 'package:chess_app/views/pages/main/bloc/cubit.dart';
import 'package:chess_app/views/pages/main/bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_theme.dart';
import '../../../consts.dart';
import '../../widgets/background_widget.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final user = MainCubit.get(context).currentUser;
        return Stack(children: [
          BackgroundWidget(),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: defSpacing * 3),
            Container(
                margin: EdgeInsets.only(right: 8),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: primaryColor, width: 2),
                    image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(user.image ?? defImage)))),
            SizedBox(height: defSpacing / 2),
            Text('${user.name}', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: defSpacing / 4),
            Text('${user.rating}', style: Theme.of(context).textTheme.caption!.copyWith(color: primaryColor)),
            SizedBox(height: defSpacing * 3),
            ...options.map((option) => ListTile(
                onTap: () {},
                title: Text(option, style: TextStyle(color: Colors.white70)),
                leading: Icon(optionsIcons[options.indexOf(option)], color: Colors.white70)))
          ]),
        ]);
      },
    );
  }

  List<String> options = ['Language', 'Share App', 'Rate App', 'Version 3.0.2'];
  List<IconData> optionsIcons = [Icons.language, Icons.share, CupertinoIcons.heart, Icons.verified_outlined];
}
