import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/settings/settings_screen.dart';
import '../network/remote/dio_helper.dart';
import '/modules/business/business_screen.dart';
import '/shared/cubit/states.dart';
import '../../modules/science/science_screen.dart';
import '../../modules/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentNaveBarIndex = 0;

  // naveBar Items widget
  List<BottomNavigationBarItem> naveBarBottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined,),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports_sharp,),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined,),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings,),
      label: "Sittings",
    ),
  ];
  List<Widget> screen=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  /*
  عند الضغط على الايكون يتم ارسال رقم الاندكس الحالي لهذه الدالة
  ومن ثم تقوم هي بتعديل الانكس الحالي
  ثم تعديل الحالة الي انه تم الضغط على احد ازرار النافيجيشن بار
  */
  void changeBottomNavBar(int index){
    currentNaveBarIndex = index;
    emit(NewsBottomNavState());
  }
  List<dynamic> business = [];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DiaHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'7a3b28ec14fd41e594b4e89d550beb2e'
        }
    ).then((value){
      if (kDebugMode) {
        business = value?.data['articles'];
        print(business[0]['title']);
        emit(NewsGetBusinessSuccessState());
      }
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      }
    });
  }
}
