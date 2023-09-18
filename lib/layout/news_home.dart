import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search/serach_screen.dart';
import 'package:news_app/shared/components/components.dart';
import '../shared/cubit/theme_cubit.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('news app'),
            actions: [
              IconButton(onPressed: () {
                navigateTo(context, SearchScreen());
              }, icon: Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  ThemeCubit.get(context).changeAppMode();

                },
                // icon: ThemeCubit.get(context).isDark
                //     ? Icon(Icons.light_mode)
                //     : Icon(Icons.brightness_4_outlined),
                icon: Icon(Icons.light),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentNaveBarIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.naveBarBottomItems,
          ),
          body: cubit.screen[cubit.currentNaveBarIndex],
        );
      },
    );
  }
}
