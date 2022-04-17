import 'package:flutter/material.dart';

Widget pogod(BuildContext context, IconData icon, String temp, String pogod) {
  return Center(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 60),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.02,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              temp,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              pogod.replaceFirst(RegExp(' '), '\n', 0),
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
