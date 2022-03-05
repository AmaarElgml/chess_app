import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app_theme.dart';
import '../../../consts.dart';
import '../../../model/pojo/user.dart';
import '../../widgets/background_widget.dart';
import '../friends/bloc/cubit.dart';
import '../friends/bloc/states.dart';

class SearchPage extends StatelessWidget {
  static String id = 'SearchPage.id';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FriendsCubit, FriendsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final FriendsCubit cubit = FriendsCubit.get(context);
          List<AppUser> search = cubit.search;
          return WillPopScope(
              onWillPop: () {
                cubit.clearSearch();
                Navigator.pop(context);
                return Future.value(true);
              },
              child: Stack(children: [
                BackgroundWidget(),
                Scaffold(
                    appBar: AppBar(title: Text('Search')),
                    body: Container(
                        padding: EdgeInsets.all(defSpacing),
                        child: Column(children: [
                          TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Search for a friend by email', fillColor: Colors.white, filled: true),
                              onChanged: (value) {
                                cubit.searchForFriend(value);
                              }),
                          Expanded(
                              child: ListView.builder(
                                  itemCount: search.length,
                                  itemBuilder: (context, index) {
                                    final AppUser searchPerson = search[index];
                                    return ListTile(
                                        title: Text(searchPerson.email, style: TextStyle(color: Colors.white)),
                                        subtitle: Text(searchPerson.name ?? 'Friend$index',
                                            style: TextStyle(color: Colors.grey)),
                                        leading: Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                                '${searchPerson.image ?? defImage}',
                                                fit: BoxFit.fill)),
                                        trailing: TextButton(
                                            child: Text('Add Friend'),
                                            onPressed: () {
                                              cubit.addFriend(searchPerson.id);
                                            }),
                                        contentPadding: EdgeInsets.zero);
                                  }))
                        ])))
              ]));
        });
  }
}
