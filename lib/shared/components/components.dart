import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticleItem(article, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: SizedBox(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget mySeparator() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list) => ConditionalBuilder(
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
