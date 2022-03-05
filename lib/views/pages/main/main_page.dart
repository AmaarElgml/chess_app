import 'package:chess_app/consts.dart';
import 'package:chess_app/views/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/services/local/cache_helper.dart';
import '../../widgets/background_widget.dart';
import 'bloc/cubit.dart';
import 'bloc/states.dart';

class MainPage extends StatelessWidget {
  static String id = 'MainPage.id';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MainCubit cubit = MainCubit.get(context);
          cubit.getCurrentUser();
          return Stack(
            children: [
              BackgroundWidget(),
              Scaffold(
                  appBar: AppBar(title: Text(cubit.titles[cubit.currentIndex]), actions: [
                    IconButton(
                        onPressed: () {
                          navigateTo(context, SearchPage.id);
                        },
                        icon: Icon(Icons.search)),
                  ]),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeCurrentIndex(index);
                    },
                    items: cubit.bottomItems,
                  ),
                  body: cubit.pages[cubit.currentIndex]),
            ],
          );
        });
  }
}
