import 'package:weather_app/builderlist.dart';
import 'package:weather_app/peremen.dart';
import 'package:weather_app/presentation/costum_icon_icons.dart';
import 'package:weather_app/cityStart.dart';
import 'package:weather_app/data.dart';
import 'package:weather_app/logo.dart';
import 'package:weather_app/parametrPogod.dart';
import 'package:weather_app/pogod.dart';
import 'package:weather_app/serelization/sevendayWeather.dart';
import 'package:weather_app/serelization/weatherSerel.dart';
import 'package:weather_app/sevendayparametr.dart';
import 'package:weather_app/weatheryavl.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

int day;

class _HomeState extends State<Home> {
  TextEditingController SarchController = TextEditingController();
  Weather weth = Weather();
  FocusNode _focus = FocusNode();
  bool proverka;
  void ProverkaPading() {
    if (proverka == false) {
      future(SarchController.text);
    }
  }

  void _onFocusChange() {
    proverka = _focus.hasFocus;
    ProverkaPading();
  }

  Future<SevenDayList> list;
  var speed;
  var humidity;
  int id = 0;
  String description = "";
  int dayTest;
  String test;
  String main = "";
  var pressure;
  var temp;
  String country = "";
  String name = "";
  void future(String city) async {
    try {
      weth = await getWeatherList(city);
      sevenday = await getSevenDayList(city);
      speed = weth.speed.round();
      pressure = weth.pressure.round();
      humidity = weth.humidity.round();
      temp = weth.temp.round();
      name = weth.name;
      country = weth.country;
      description = weth.description;
      name = weth.name;
    } catch (e) {
      print(e);
      return;
    }
    setState(() {});
  }

  @override
  void initState() {
    future("Клинцы");
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  Widget build(BuildContext context) {
    day = DateTime.now().weekday - 1;
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Column(
        children: [
          logo(context),
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                enterCyti(context, SarchController),
                cityStart(context, "$name, $country"),
                data(context),
                pogod(context, weatherYavl(description), "${temp ?? 0.0}°C",
                    description),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
               
                parametrPogod(context, speed, humidity, pressure),
                sevendayparametr(context),
                builderList(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget enterCyti(
    BuildContext context,
    TextEditingController controller,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.search, color: Colors.white),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            focusNode: _focus,
            controller: controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              hintText: "Enter City Name",
            ),
          ),
        ),
      ],
    );
  }
}
