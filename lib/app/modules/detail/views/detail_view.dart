import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news/app/data/model/news.dart';

import '../../../utils/constant.dart';
import '../../../widget/general_widget.dart';
import '../../../widget/progress_loading.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final _controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: Row(
          children: [
            Image.asset("assets/icons/logo.png", height: 30),
            Expanded(
              child: Obx(
                () => defaultText(
                  _controller.type.value,
                  textAlign: TextAlign.end,
                  size: 20,
                  color: COLOR_PRIMARY,
                  weight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Obx(
            () {
              News data = _controller.news.value;
              var inputDate = DateFormat('yyyy-MM-ddThh:mm:ssZ')
                  .parse(data.createdAt ?? '2021-05-24T00:14:44.689Z');
              var date = DateFormat('EEEE, dd MMMM yyyy').format(inputDate);

              List<Widget> imageSliders = [];
              if (data.slideshow != null) {
                imageSliders = data.slideshow!
                    .map(
                      (item) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        width: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(imageUrl: item)),
                      ),
                    )
                    .toList();
              }
              print("lenght ${imageSliders.length}");

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  defaultText(
                    data.title ?? "",
                    size: 20,
                  ),
                  SizedBox(height: 16),
                  defaultText(
                    "By ${data.contributorName}",
                    size: 12,
                    color: COLOR_PRIMARY,
                  ),
                  SizedBox(height: 8),
                  defaultText(date, size: 12),
                  SizedBox(height: 20),
                  CachedNetworkImage(
                    imageUrl: data.contentThumbnail ?? "",
                    placeholder: (context, url) => ProgressLoading(),
                  ),
                  SizedBox(height: 8),
                  imageSliders.length > 0
                      ? Center(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: imageSliders,
                            ),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 20),
                  defaultText(
                    data.content ?? "",
                    size: 14,
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      defaultText(
                        "Baca Juga:",
                        size: 12,
                        weight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                      SizedBox(width: 8),
                      InkWell(
                        onTap: _controller.readMore,
                        child: defaultText(
                          _controller.moreData.value.title ?? "",
                          size: 12,
                          color: COLOR_PRIMARY,
                          weight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          // SizedBox(height: 8),
          // defaultText(
          //   timeAgo.format(time, locale: "ID"),
          //   size: 12,
          //   weight: FontWeight.normal,
          // ),
        ),
      ),
    );
  }
}
