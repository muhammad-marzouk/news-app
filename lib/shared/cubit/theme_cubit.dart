import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';

class ThemeCubit extends Cubit<NewsStates> {
  ThemeCubit() : super(NewsInitialState());
  static ThemeCubit get(context) => BlocProvider.of(context);


  bool isDark = false;
  void changeAppMode(){
    isDark = !isDark;
    emit(NewsChangeModeState());
  }
}

