import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business/business_screen.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/science/science_screen.dart';
import 'package:news_app/setting_screen/setting_screen.dart';
import 'package:news_app/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  //this function we use it in any place to create an object from this cubit
  static NewsCubit get(context) => BlocProvider.of(context);

  List screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'business'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'sports'),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

//start get business data
  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingState());
    DioHelper.get(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '0563f632697e4b5f8e9d112b3d650469'
    }).then(
      (value) {
        business = value.data['articles'];

        emit(NewsGetBusinessSuccessState());
      },
    ).catchError((e) {
      print(e.toString());

      emit(NewsGetBusinessErrorState(error: e));
    });
  }
//end get business data

//start get business data
  List<dynamic> science = [];

  void getScience() {
    emit(NewsLoadingState());
    DioHelper.get(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': '0563f632697e4b5f8e9d112b3d650469'
    }).then(
      (value) {
        science = value.data['articles'];

        emit(NewsGetScienceSuccessState());
      },
    ).catchError((e) {
      print(e.toString());

      emit(NewsGetScienceErrorState(error: e));
    });
  }
//end get science data

//start get sports data
  List<dynamic> sports = [];

  void getSports() {
    emit(NewsLoadingState());
    DioHelper.get(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': '0563f632697e4b5f8e9d112b3d650469'
    }).then(
      (value) {
        sports = value.data['articles'];

        emit(NewsGetSportsSuccessState());
      },
    ).catchError((e) {
      print(e.toString());

      emit(NewsGetSportsErrorState(error: e));
    });
  }
//end get sports data

//start get sports data
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsLoadingState());
    DioHelper.get(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '0563f632697e4b5f8e9d112b3d650469'
    }).then(
      (value) {
        search = value.data['articles'];

        emit(NewsGetSearchSuccessState());
      },
    ).catchError((e) {
      print(e.toString());

      emit(NewsGetSearchErrorState(error: e));
    });
  }
//end get business data

}
