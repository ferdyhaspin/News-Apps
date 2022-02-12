import 'package:flutter/material.dart';

import '../utils/constant.dart';

AppBar defaultAppBar(String title, callback, {double elevation = 0}) {
  if (callback != null) {
    return AppBar(
      elevation: elevation,
      leading: GestureDetector(
        child: Center(
          child: Image.asset("assets/icons/ic_left_back.png", width: 28),
        ),
        onTap: callback,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  } else {
    return AppBar(
      elevation: elevation,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}

Text defaultText(
  String text, {
  double size = 16,
  FontWeight weight = FontWeight.w600,
  Color color = Colors.black,
  TextAlign textAlign: TextAlign.start,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
    ),
  );
}
