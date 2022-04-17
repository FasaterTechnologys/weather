import 'package:weather_app/PogodSnow.dart';
import 'package:flutter/cupertino.dart';

Widget parametrPogod(BuildContext context, var i1, var i2, var i3) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PogodSnow(i1.toString(), "km/hr"),
          PogodSnow(i2.toString(), "%"),
          PogodSnow(i3.toString(), "hPa"),
        ],
      ),
    ),
  );
}
