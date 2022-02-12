import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant.dart';
import '../../../widget/general_widget.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final type = ['Drama', 'Fabulous', 'Otomotif', 'TV Star', 'Indonesia'];
  final random = new Random();

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
              child: defaultText(
                type[random.nextInt(type.length)],
                textAlign: TextAlign.end,
                size: 20,
                color: COLOR_PRIMARY,
                weight: FontWeight.w700,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
