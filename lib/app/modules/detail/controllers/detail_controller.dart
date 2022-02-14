import 'dart:math';

import 'package:get/get.dart';
import 'package:news/app/data/model/news.dart';
import 'package:news/app/data/repository/news_repository.dart';

import '../../../routes/app_pages.dart';

class DetailController extends GetxController {
  final data = NewsRepository.data;
  final news = News().obs;
  final moreData = News().obs;
  final type = "".obs;

  final _type = ['Drama', 'Fabulous', 'Otomotif', 'TV Star', 'Indonesia'];
  final _random = new Random();

  @override
  void onInit() {
    super.onInit();
    _initData(Get.arguments);
  }

  void readMore() {
    _initData(moreData.value);
    Get.toNamed(Routes.DETAIL, preventDuplicates: false);
  }

  void _initData(News _news) {
    news.value = _news;
    type.value = _type[_random.nextInt(_type.length)];

    var _index = _random.nextInt(data.length);
    if (_index + 1 == int.parse(_news.id ?? "0")) {
      _index++;
    }

    if (_index == data.length - 1) {
      _index = 0;
    }

    moreData.value = data[_index];
  }

}
