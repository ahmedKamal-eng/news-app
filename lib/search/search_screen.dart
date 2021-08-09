import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onChange: (value) {
                        NewsCubit.get(context).getSearch(value);
                      },
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'search must be not empty';
                        } else {
                          return null;
                        }
                      },
                      label: 'search',
                      prefix: Icons.search),
                  Expanded(
                      child: articleBuilder(
                          list: list, context: context, isSearch: true))
                ],
              ),
            ),
          );
        });

    ;
  }
}
