import 'package:dio/dio.dart';
import 'package:news/app/data/model/news.dart';
import 'package:news/app/utils/failure.dart';

import '../../utils/constant.dart';

class NewsRepository {
  Future<List<News>> getArticle() async {
    Dio dio = Dio(ConstConfig.dioBaseOptions());
    dio.interceptors.add(ConstConfig.dioPrettyLog());

    Response response = await dio.get(PATH_GET_ARTICLES);
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((item) => News.fromJson(item))
          .toList();
    } else {
      throw RequestException(response.data);
    }
  }
}
