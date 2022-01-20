import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/compontents/build_item.dart';
import 'package:news_app/shared/cubit/news_cubit.dart';
import 'package:news_app/shared/cubit/news_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        List<dynamic> bus = cubit.business;
        return bus.length > 0
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildNewItem(bus[index], context),
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color:
                            cubit.isDark ? Colors.grey[700] : Colors.grey[200],
                      ),
                    ),
                itemCount: bus.length)
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}
