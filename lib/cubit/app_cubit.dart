import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/cache_helper.dart';

// =====================================================
// ====) we create this cubit to use it in the main ====
// #####################################################

class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(NewsInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  // change theme Mode
  bool isDark = false;
  void changeMode({bool formShared}) {
    if (formShared !=
        null) // this occurs when you use the app for first time(there is no value in cache
    {
      isDark = formShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
      });
    }
  }
// end change theme Mode
}
