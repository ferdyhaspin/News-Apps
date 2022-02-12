import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/app/data/model/news.dart';
import 'package:news/app/utils/constant.dart';
import 'package:news/app/widget/general_widget.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class HomeItem extends StatelessWidget {
  final News news;

  const HomeItem({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = DateFormat("yyyy-MM-ddThh:mm:ssZ").parse(news.createdAt ?? "");
    final type = ['Drama', 'Fabulous', 'Otomotif', 'TV Star', 'Indonesia'];
    final random = new Random();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: news.contentThumbnail ?? "",
            ),
            SizedBox(height: 16),
            defaultText(
              type[random.nextInt(type.length)],
              size: 14,
              color: COLOR_PRIMARY,
              weight: FontWeight.normal,
            ),
            defaultText(
              news.title ?? "",
              size: 24,
              weight: FontWeight.normal,
            ),
            SizedBox(height: 8),
            defaultText(
              timeAgo.format(time, locale: "ID"),
              size: 12,
              weight: FontWeight.normal,
            ),
          ],
        ),
      ),
    );
  }
}
