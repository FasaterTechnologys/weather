import 'package:flutter/material.dart';
import 'package:weather_app/presentation/costum_icon_icons.dart';

IconData weatherYavl(String weather) {
  IconData icon = Icons.error;
  if (weather == "ясно") icon = CostumIcon.one;
  if (weather == "небольшая облачность") icon = CostumIcon.two;
  if (weather == "облачно с прояснениями") icon = CostumIcon.A;
  if (weather == "переменная облачность") icon = CostumIcon.A;
  if (weather == "пасмурно") icon = CostumIcon.three;
  if (weather == "cлабый снегопад") icon = CostumIcon.H;
  if (weather == "умеренный снегопад") icon = CostumIcon.H;
  if (weather == "cильный снегопад") icon = CostumIcon.H;
  if (weather == "сильный ливневой дождь") icon = CostumIcon.L;
  if (weather == "cлабый ливневой дождь") icon = CostumIcon.L;
  if (weather == "умеренный ливневой дождь") icon = CostumIcon.L;
  if (weather == "cлабый дождь") icon = CostumIcon.M;
  if (weather == "небольшой дождь") icon = CostumIcon.M;
  if (weather == "сильный дождь") icon = CostumIcon.U;
  return icon;
}
