import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/theme_cubit.dart';
import 'package:news_app/shared/cubit/theme_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'shared/network/remote/dio_helper.dart';
import 'layout/news_home.dart';
import 'shared/cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  Bloc.observer = MyBlocObserver();
  DiaHelper.init();


  // bool isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(false));
}
class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (BuildContext context) => ThemeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ThemeCubit,ThemeStates>(
        listener:(context,state) {},
        builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              // primarySwatch: Colors.grey,
              primaryColorLight: Colors.white,
              primaryColorDark: Colors.white,

              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.blue,
              ),
              useMaterial3: true,
              colorSchemeSeed: Colors.blue, // for CircularProgressIndicator
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
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
              textTheme: const TextTheme(
                bodyText1: TextStyle(
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
                titleSpacing: 20.0,
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('333739'),
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 30.0,
                ),
                iconTheme:  const IconThemeData(
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
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

            ),
            themeMode: ThemeCubit.get(context).isDark? ThemeMode.dark: ThemeMode.light,
            // themeMode: ThemeMode.light,
            home: const NewsLayout(),
          );
        },

      ),
    );
  }
}

