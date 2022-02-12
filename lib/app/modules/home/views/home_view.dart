import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/modules/home/views/widget/home_item.dart';
import 'package:news/app/widget/general_widget.dart';
import 'package:news/app/widget/progress_loading.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Image.asset("assets/icons/logo.png", height: 30),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
              () => _controller.isLoading.isTrue
              ? ProgressLoading()
              : SingleChildScrollView(
            child: Column(
              children: [
                defaultText(
                  'LATEST NEWS',
                  size: 20,
                  color: Colors.black,
                ),
                SizedBox(height: 16),
                Divider(height: 1, color: Colors.black),
                SizedBox(height: 16),
                ...List.generate(
                  _controller.list.length,
                      (index) => HomeItem(
                    news: _controller.list[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
