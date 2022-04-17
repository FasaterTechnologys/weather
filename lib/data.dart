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

List month = [
  "Январь",
  "Февраль",
  "Март",
  "Апрель",
  "Май",
  "Июнь",
  "Июль",
  "Август",
  "Сентябрь",
  "Октябрь",
  "Ноябрь",
  "Декабрь",
];

String dataReturn(int dayW, int monthInt) {
  String day = week[--dayW];
  String monthW = month[--monthInt];
  return day +
      ", " +
      monthW +
      " " +
      DateTime.now().day.toString() +
      ", " +
      DateTime.now().year.toString();
}

Widget data(BuildContext context) {
  return Center(
    child: Text(
      dataReturn(DateTime.now().weekday, DateTime.now().month),
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
