import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        print(list.length);
        return ConditionalBuilder(
            condition: state is! NewsGetBusinessLoadingState,
            builder: (context) => ListView.separated(
              // physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildArticleItem(list[index]),
              separatorBuilder: (context, index)=> mySeparator(),
              itemCount: list.length,
            ),
            fallback: (context) => Center(child: CircularProgressIndicator())
        );
        }
    );
  }
}
