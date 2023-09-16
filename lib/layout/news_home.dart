import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/theme_cubit.dart';
import '/shared/cubit/cubit.dart';
import '/shared/cubit/states.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer <NewsCubit,NewsStates>(
        listener: (BuildContext context, Object? state) {  },
        builder: (BuildContext context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('news app'),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search)),
                IconButton(
                    onPressed: (){
                      ThemeCubit.get(context).changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentNaveBarIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.naveBarBottomItems,
            ),
            body: cubit.screen[cubit.currentNaveBarIndex],
          );
        },
      ),
    );
  }
}
