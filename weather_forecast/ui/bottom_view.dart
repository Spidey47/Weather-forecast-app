import 'package:flutter/material.dart';

import '../model/weather_forecast_model.dart';
import 'forecast_card.dart';

class BottomView extends StatelessWidget {
 final AsyncSnapshot<WeatherForecastModel> snapshot;

  const BottomView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("7-Day Weather Forecast".toUpperCase(),
          style:TextStyle(
              fontSize: 14,
              color: Colors.black87
          ) ,),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.7,
                  height: 160,
                  child: forecastCard(snapshot, index),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
                          begin: Alignment.topLeft, end: Alignment.bottomRight)
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(width: 8,),
              itemCount: snapshot.data!.list!.length),
        )
      ],
    );
  }
}


Widget bottomView(AsyncSnapshot<WeatherForecastModel> snapshot, BuildContext context) {
  var forecastList = snapshot.data?.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),
        style:TextStyle(
          fontSize: 14,
          color: Colors.black87
        ) ,),
      Container(
        height: 170,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff9661C3), Colors.white],
                  begin: Alignment.topLeft, end: Alignment.bottomRight)
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 8,),
            itemCount: forecastList!.length),
      )
    ],
  );
}