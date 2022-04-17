import 'package:weather_app/peremen.dart';
import 'package:weather_app/serelization/sevendayWeather.dart';
import 'package:weather_app/serelization/weatherSerel.dart';
import 'package:weather_app/weatheryavl.dart';
import 'package:flutter/material.dart';

List week = [
  "Понедельник",
  "Вторник",
  "Среда",
  "Четверг",
  "Пятница",
  "Суббота",
  "Воскресенье",
];

Widget builderList(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.16,
    child: ListView.builder(
      itemExtent: 183,
      scrollDirection: Axis.horizontal,
      itemCount: 7,
      itemBuilder: (context, index) {
        String data;
        int i = 7 + DateTime.now().weekday + index - 7;
        if (i >= 7) i = i - 7;
        data = week[i];
        IconData icon = weatherYavl(
            sevenday.txs == null ? "ясно" : sevenday.txs[index].description);
        var temp = sevenday.txs == null ? 0.0 : sevenday.txs[index].temp;
        return Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${temp.round().toString()}°C",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Icon(icon, color: Colors.white, size: 40),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
