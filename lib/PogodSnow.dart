import 'package:flutter/material.dart';

Widget PogodSnow(String chisl, String param) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Icon(Icons.ac_unit, color: Colors.white, size: 30),
      Text(
        chisl,
        style: TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200),
      ),
      Text(
        param,
        style: TextStyle(
            color: Colors.white, fontSize: 13, fontWeight: FontWeight.w200),
      ),
    ],
  );
}
