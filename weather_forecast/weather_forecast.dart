import 'package:first/weather_forecast/ui/bottom_view.dart';
import 'package:first/weather_forecast/ui/mid_View.dart';
import 'package:flutter/material.dart';

import 'model/weather_forecast_model.dart';
import 'network/network.dart';

class WeatherForecast extends StatefulWidget {

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
   String _cityName = "San Diego";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forecastObject = getWeather(cityName: _cityName);

   // forecastObject.then((weather) => {
     // print(weather.list![0].weather?[0].main)
   // });





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          textFieldView(),

          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){

                  if(snapshot.hasData){
                    return Column(
                      children: [
                        MidView(snapshot: snapshot),
                        //midView(snapshot),
                       BottomView(snapshot: snapshot)
                       // bottomView(snapshot, context)
                      ],
                    );
                  }else{
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
              }),
          )
        ],
      ),
    );
  }

 Widget textFieldView() {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter City Name",
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.all(8)
          ),
          onSubmitted:(value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });

          },
        ),
      ),
    );

  }

 Future<WeatherForecastModel> getWeather({required String cityName}) =>
      Network().getWeatherForecast(cityName: _cityName);
}
