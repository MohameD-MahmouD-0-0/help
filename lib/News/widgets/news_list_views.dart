// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/News/models/article_model.dart';
import 'package:flutter_application_1/News/widgets/new_tile.dart';

// ignore: must_be_immutable
class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      childCount: articles.length,
      (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
          child: NewsTile(
            articleModel: articles[index],
          ),
        );
      },
    ));
  }
}
