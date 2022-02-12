import 'package:flutter/material.dart';

class ProgressLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Container(
            margin: EdgeInsets.all(5),
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
            ),
          ),
        ),
      ],
    );
  }
}