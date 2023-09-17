import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/theme_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(NewsInitialModeState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;

  void changeAppMode({bool? fromShared}){
    if(fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    }else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isd=Dark', value: isDark).then((value){
        emit(NewsChangeModeState());
      });
    }
  }
}

