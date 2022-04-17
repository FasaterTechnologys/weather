import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SevenDayList {
  List<SevenDay> txs;
  SevenDayList({this.txs});

  factory SevenDayList.fromJson(List json) {
    print("Сортировка данных...");
    List<SevenDay> txsList = json.map((i) => SevenDay.fromJson(i)).toList();
    print("Успешно!");
    return SevenDayList(txs: txsList);
  }
}

class SevenDay {
  int id;
  var temp;
  String description;
  String dt_txt;
  SevenDay({
    this.id,
    this.temp,
    this.description,
    this.dt_txt,
  });
  factory SevenDay.fromJson(Map<String, dynamic> json) {
    return SevenDay(
      id: json["weather"][0]["id"] as int,
      temp: json["main"]["temp"],
      description: json["weather"][0]["description"] as String,
      dt_txt: json["dt_txt"] as String,
    );
  }
}

Future<SevenDayList> getSevenDayList(String sity) async {
  var res = "";
  sity = sity + " ";
  for (int i = 0; i < sity.length; i++) {
    try {
      if (sity[i] != " ") {
        if (sity[i + 1] == " ") {
          res = res + sity[i] + sity[i + 1];
        } else
          res = res + sity[i];
        print(res);
      }
    } catch (e) {
      break;
    }
  }
  String url =
      "http://api.openweathermap.org/data/2.5/forecast?units=metric&lang=ru&cnt=7&q=" +
          res.trim() +
          "&appid=d9096061a41876a928dc6f403c103e3a";
  print(url);
  print("Подключение к серверу...");
  var response = await http.get(url);
  var txsAdress = json.decode(response.body);

  if (response.statusCode == 200) {
    print("Подключено успешно! Обработка...");
    print(txsAdress["list"]);
    return SevenDayList.fromJson(txsAdress["list"]);
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
