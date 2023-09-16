import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../shared/network/remote/dio_helper.dart';
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
              title: Text('news app'),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.search)),
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
