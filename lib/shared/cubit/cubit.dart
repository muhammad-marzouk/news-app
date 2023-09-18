import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_outlined,),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_sharp,),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_outlined,),
      label: "Science",
    ),
  ];
  List<Widget> screen=[
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];
  /*
  عند الضغط على الايكون يتم ارسال رقم الاندكس الحالي لهذه الدالة
  ومن ثم تقوم هي بتعديل الانكس الحالي
  ثم تعديل الحالة الي انه تم الضغط على احد ازرار النافيجيشن بار
  */
  void changeBottomNavBar(int index){
    currentNaveBarIndex = index;
    if (index == 0){
      getBusiness();
    }else if (index == 1){
      getSports();
    }else if (index == 2){
      getScience();
    }
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

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    DiaHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'Sports',
          'apiKey':'7a3b28ec14fd41e594b4e89d550beb2e'
        }
    ).then((value){
      if (kDebugMode) {
        sports = value?.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      }
    });
  }

  List<dynamic> science = [];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DiaHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'7a3b28ec14fd41e594b4e89d550beb2e'
        }
    ).then((value){
      if (kDebugMode) {
        science = value?.data['articles'];
        print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }
    }).catchError((error){
      if (kDebugMode) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      }
    });
  }

  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsSearchLoadingState());
    DiaHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':value,
        'apiKey':'7a3b28ec14fd41e594b4e89d550beb2e',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value?.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((error){
      emit(NewsSearchErrorState(error.toString()));
    });
  }

}
