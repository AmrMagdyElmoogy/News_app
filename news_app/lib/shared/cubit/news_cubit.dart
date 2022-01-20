import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business_Screen/business_screen.dart';
import 'package:news_app/modules/science_Screen/science_screen.dart';
import 'package:news_app/modules/settings_Screen/settings_screen.dart';
import 'package:news_app/modules/sports_Screen/sports_screen.dart';
import 'package:news_app/shared/cubit/news_state.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void changeIndex(int i) {
    currentIndex = i;
    if (i == 0) {
      getBusiness();
    }
    if (i == 1) {
      getSports();
    }
    if (i == 2) {
      getScience();
    }
    emit(NewsBottomNavChangeState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsLoadingBusinessNewsState());
    DioHelper.get(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': 'dcfe4924c5c641f498837207c4a28e96',
    })
        .then((value) => {
              business = value.data['articles'],
              print(business[0]['title']),
              emit(NewsGetBusinessNewsState()),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsLoadingBusinessNewsState());
    DioHelper.get(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': 'dcfe4924c5c641f498837207c4a28e96',
    })
        .then((value) => {
              sports = value.data['articles'],
              emit(NewsGetSportsNewsState()),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsLoadingScienceNewsState());
    DioHelper.get(path: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': 'dcfe4924c5c641f498837207c4a28e96',
    })
        .then((value) => {
              science = value.data['articles'],
              emit(NewsGetScienceState()),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

  bool isDark = false;

  void changeDarkMode({bool mode}) {
    if (mode != null) {
      isDark = mode;
      emit(NewsDarkModeState());
    } else {
      isDark = !isDark;
      CacheHelper.setDate(key: 'isDark', value: isDark);
      emit(NewsDarkModeState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsLoadingSearchNewsState());
    DioHelper.get(path: 'v2/everything', query: {
      'q': '$value',
      'apikey': 'dcfe4924c5c641f498837207c4a28e96',
    })
        .then((value) => {
              search = value.data['articles'],
              emit(NewsGetSearchState()),
            })
        .catchError((onError) {
      print(onError.toString());
    });
  }

}
