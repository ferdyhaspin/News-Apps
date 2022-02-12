import 'package:get/get.dart';

import 'package:news/app/modules/detail/bindings/detail_binding.dart';
import 'package:news/app/modules/detail/views/detail_view.dart';
import 'package:news/app/modules/home/bindings/home_binding.dart';
import 'package:news/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
  ];
}
