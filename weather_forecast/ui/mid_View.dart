import 'package:first/weather_forecast/util/convert_icon.dart';
import 'package:first/weather_forecast/util/forecast_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../model/weather_forecast_model.dart';

class MidView extends StatelessWidget {
 final AsyncSnapshot<WeatherForecastModel> snapshot;

  const MidView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city?.name;
    var country = snapshot.data?.city?.country;
    var formatteddate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    var forecast = forecastList[0];
    return  Container(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("$city, $country",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87
              ),),
            Text("${Util.getFormattedDate(formatteddate)}", style: TextStyle(
                fontSize: 15
            ),),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main, color: Colors.pinkAccent, size: 198),
            ),
            //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${forecast.main?.temp?.toStringAsFixed(0)}°F",
                      style:TextStyle(
                          fontSize: 34
                      ) ,),
                  ),
                  Text("${forecast.weather![0].description?.toUpperCase()}"),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.wind?.speed?.toStringAsFixed(1)} mi/h"),
                        Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.main?.humidity?.toStringAsFixed(0)} %"),
                        Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20,color: Colors.brown,)
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${forecast.main?.tempMax?.toStringAsFixed(0)} °F"),
                        Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                      ],
                    ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}


Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data?.list;
  var city = snapshot.data?.city?.name;
  var country = snapshot.data?.city?.country;
  var formatteddate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
  var forecast = forecastList[0];
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$city, $country",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87
          ),),
          Text("${Util.getFormattedDate(formatteddate)}", style: TextStyle(
            fontSize: 15
          ),),
          
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(weatherDescription: forecastList[0].weather![0].main, color: Colors.pinkAccent, size: 198),
          ),
          //Icon(FontAwesomeIcons.cloud, size: 198, color: Colors.pinkAccent,),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${forecast.main?.temp?.toStringAsFixed(0)} °F",
                  style:TextStyle(
                    fontSize: 34
                  ) ,),
                Text("${forecast.weather![0].description?.toUpperCase()}"),

                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.wind?.speed?.toStringAsFixed(1)} mi/h"),
                      Icon(FontAwesomeIcons.wind, size: 20, color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${forecast.main?.humidity?.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidFaceGrinBeamSweat, size: 20,color: Colors.brown,)
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecast.main?.tempMax?.toStringAsFixed(0)} °F"),
                    Icon(FontAwesomeIcons.temperatureHigh, size: 20, color: Colors.brown,)
                  ],
                ),)
              ],
            ),
          )
          
        ],
      ),
    ),
  );
  return midView;
}