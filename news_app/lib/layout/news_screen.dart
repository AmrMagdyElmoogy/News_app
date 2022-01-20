import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_Screen/search_screen.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';
import 'package:news_app/shared/cubit/news_state.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
            title: Text(
              'News App',
              style:
                  TextStyle(fontFamily: 'Fav', fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                icon: cubit.isDark
                    ? Icon(Icons.light_mode)
                    : Icon(Icons.dark_mode),
                onPressed: () {
                  cubit.changeDarkMode();
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.business_center),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer),
                  label: 'Sports',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.science),
                  label: 'Science',
                ),
              ]),
        );
      },
    );
  }
}
