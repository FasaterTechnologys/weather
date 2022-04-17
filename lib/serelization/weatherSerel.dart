import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather {
  int id;
  String description;
  String main;
  var temp;
  var speed;
  var humidity;
  var pressure;
  String country;
  String name;
  Weather({
    this.id,
    this.description,
    this.main,
    this.speed,
    this.humidity,
    this.pressure,
    this.temp,
    this.country,
    this.name,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    print("Упешная обработка!");
    return Weather(
      id: json["weather"][0]["id"] as int,
      description: json["weather"][0]["description"] as String,
      main: json["weather"][0]["main"] as String,
      speed: json["wind"]["speed"],
      humidity: json["main"]["humidity"],
      pressure: json["main"]["pressure"],
      temp: json["main"]["temp"],
      country: json["sys"]["country"] as String,
      name: json["name"] as String,
    );
  }
}

Future<Weather> getWeatherList(String sity) async {
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
  res = res.substring(0, res.length - 1);
  String url =
      "http://api.openweathermap.org/data/2.5/weather?units=metric&lang=ru&q=" +
          res +
          "&appid=c20493d8f9ebfc483ce4bf1205c0796d";
  print(url);
  print("Подключение к серверу...");
  var response = await http.get(url);
  //var adressJson = json['result']['address'];
  var jsonAdress = json.decode(response.body);

  if (response.statusCode == 200) {
    print("Подключено успешно! Обработка...");
    return Weather.fromJson(jsonAdress);
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
