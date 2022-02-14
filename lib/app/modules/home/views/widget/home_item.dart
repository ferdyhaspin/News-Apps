import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news/app/data/model/news.dart';
import 'package:news/app/routes/app_pages.dart';
import 'package:news/app/utils/constant.dart';
import 'package:news/app/widget/general_widget.dart';
import 'package:news/app/widget/progress_loading.dart';
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
        onTap: () {
          Get.toNamed(Routes.DETAIL, arguments: news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: news.contentThumbnail ?? "",
              placeholder: (context, url) => ProgressLoading(),
            ),
            SizedBox(height: 16),
            defaultText(
              type[random.nextInt(type.length)],
              size: 12,
              color: COLOR_PRIMARY,
              weight: FontWeight.normal,
            ),
            SizedBox(height: 8),
            defaultText(
              news.title ?? "",
              size: 20,
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
