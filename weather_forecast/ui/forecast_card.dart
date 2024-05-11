import 'package:first/weather_forecast/util/convert_icon.dart';
import 'package:first/weather_forecast/util/forecast_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index){
  var forecastList = snapshot.data?.list;
  var dayOfWeek = "";
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt! * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(",")[0];

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek),
      )),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(weatherDescription: forecastList[index].weather![0].main, color: Colors.pinkAccent, size: 45),
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${forecastList[index].main?.tempMin?.toStringAsFixed(0)} °F"),
                  ),
                  Icon(FontAwesomeIcons.solidCircleDown, color: Colors.white, size: 17,)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].main?.tempMax?.toStringAsFixed(0)} °F"),
                    Icon(FontAwesomeIcons.solidCircleUp, color: Colors.white, size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].main?.humidity?.toStringAsFixed(0)} %"),
                    Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, color: Colors.white, size: 17,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    Text("${forecastList[index].wind?.speed?.toStringAsFixed(1)}"),
                    Icon(FontAwesomeIcons.wind, color: Colors.white, size: 17,)
                  ],
                ),
              ),
            ],
          )
        ],
      ),



    ],
  );
}