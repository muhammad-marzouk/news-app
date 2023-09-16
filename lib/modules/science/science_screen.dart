
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).science;
          print(list.length);
          return ConditionalBuilder(
              condition: list.isNotEmpty,
              builder: (context) => ListView.separated(
                // physics: const BouncingScrollPhysics(),

                itemBuilder: (context, index) {
                  if (index % 5==0 && index !=0){
                    return Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 60.0,
                      child: Text('😛 هحط الاعلان هنا يا ربيع بيتعمل ازاي بقى ',),
                    );
                  }
                  return buildArticleItem(list[index],context);
                },
                separatorBuilder: (context, index)=> mySeparator(),
                itemCount: list.length,
              ),
              fallback: (context) => Center(child: CircularProgressIndicator())
          );
        }
    );
  }
}
