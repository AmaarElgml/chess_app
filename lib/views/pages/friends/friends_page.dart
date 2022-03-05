import 'package:chess_app/model/pojo/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_theme.dart';
import '../../../consts.dart';
import '../../widgets/background_widget.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Stack(children: [
            BackgroundWidget(),
            FutureBuilder(
                future: FriendsCubit.get(context).getFriends(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting)
                    return Center(child: CircularProgressIndicator());

                  if (snapshot.connectionState == ConnectionState.done && !snapshot.hasData)
                    return Center(child: Text('No friends added yet!', style: TextStyle(color: Colors.grey)));
                  final cubit = FriendsCubit.get(context);
                  print('/// ${cubit.friends}');
                  return Container(
                      padding: EdgeInsets.all(defSpacing),
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: cubit.friends.length,
                          itemBuilder: (context, index) {
                            final AppUser friend = cubit.friends[index];
                            print('/// ${friend.email}');
                            return ListTile(
                                title: Text(friend.name ?? 'Friend$index', style: TextStyle(color: Colors.white)),
                                subtitle: Text(friend.rating.toString(), style: TextStyle(color: Colors.grey)),
                                leading: Image.network('${friend.image ?? defImage}'),
                                trailing: TextButton(child: Text('Challenge'), onPressed: () {}),
                                contentPadding: EdgeInsets.zero);
                          }));
                })
          ]);
        });
  }
}
