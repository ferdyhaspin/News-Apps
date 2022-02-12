import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:news/app/data/model/news.dart';
import 'package:news/app/data/repository/news_repository.dart';

import '../../../utils/constant.dart';
import '../../../utils/failure.dart';
import '../../../widget/custom_toast.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<News> list = <News>[].obs;

  final _repository = NewsRepository();

  @override
  void onInit() {
    _getArticles();
    super.onInit();
  }

  Future _getArticles() async {
    try {
      _updateIsLoading(true);

      List<News> data = await _repository.getArticle();
      list.value = data;
    } on DioError catch (e) {
      DioErrorType errorType = e.type;
      if (errorType == DioErrorType.connectTimeout ||
          errorType == DioErrorType.receiveTimeout ||
          errorType == DioErrorType.sendTimeout) {
        showMessage(ERROR_TIMEOUT);
      } else {
        showMessage(e.message);
      }
    } on Exception catch (e) {
      showMessage(e.toString());
    } on RequestException catch (e) {
      showMessage(e.message!);
    } catch (e) {
      showMessage(DEFAULT_ERROR);
    } finally {
      _updateIsLoading(false);
    }
  }

  void _updateIsLoading(bool currentStatus) {
    isLoading.value = currentStatus;
  }

  void showMessage(String message) {
    CustomToast.showToast(message);
  }
}
