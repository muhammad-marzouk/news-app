import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/theme_cubit.dart';
import 'shared/cubit/states.dart';
import 'shared/network/remote/dio_helper.dart';
import 'layout/news_home.dart';
import 'shared/cubit/bloc_observer.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  DiaHelper.init();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ThemeCubit(),
      child: BlocConsumer<ThemeCubit,NewsStates>(
        listener:(context,state) {},
        builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              // primarySwatch: Colors.grey,
              primaryColorLight: Colors.blue,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blue,
              ),
              useMaterial3: true,
              colorSchemeSeed: Colors.blue, // for CircularProgressIndicator
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                  size: 30.0,
                ),
                iconTheme:  IconThemeData(
                  color: Colors.blue,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primaryColorLight: Colors.blue,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blue,
              ),
              useMaterial3: true,
              colorSchemeSeed: Colors.blue, // for CircularProgressIndicator
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                  size: 30.0,
                ),
                iconTheme:  IconThemeData(
                  color: Colors.white,
                ),
                elevation: 0.0,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

            ),
            // themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark: ThemeMode.light,
            themeMode: ThemeMode.light,
            home: const NewsLayout(),
          );
        },

      ),
    );
  }
}

