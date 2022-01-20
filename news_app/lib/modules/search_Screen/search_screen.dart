import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/compontents/build_item.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';
import 'package:news_app/shared/cubit/news_state.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List<dynamic> searches = cubit.search;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Newsaway',
              style: TextStyle(fontFamily: 'Fav', fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(
                      fontFamily: 'Fav',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter what you want to search on';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      cubit.getSearch(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                          cubit.isDark ? Colors.grey[400] : Colors.grey[200],
                      labelStyle: TextStyle(
                        fontFamily: 'Fav',
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildNewItem(searches[index], context),
                      separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: cubit.isDark
                                  ? Colors.grey[700]
                                  : Colors.grey[200],
                            ),
                          ),
                      itemCount: searches.length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
