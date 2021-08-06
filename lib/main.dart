import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/news_layout.dart';

import 'cubit/obServer.dart';

void main() {
  // to execute the observer
  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange),
        appBarTheme: AppBarTheme(
            backwardsCompatibility:
                false, //to change the status bar color & brightness
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.black)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            elevation: 20),
      ),
      home: NewsLayout(),
    );
  }
}
