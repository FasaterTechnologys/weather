import 'package:flutter/material.dart';

Widget logo(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.07,
    child: AppBar(
      centerTitle: true,
      title: Text(
        "Weather Forecast",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
  );
}
