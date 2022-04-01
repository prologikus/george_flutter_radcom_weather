import 'dart:convert';

import 'package:george_flutter_radcom_weather/objects/city_weather_model.dart';
import '../genericRepo/weather_repository.dart';
import 'package:http/http.dart' as http;

class OpenWeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<List<CityWeatherModel>> getCitiesWeather() async {
    var result = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=b6907d289e10d714a6e88b30761fae22'));

    var json = jsonDecode(result.body);

    List<CityWeatherModel> list = [];

    //blind usage of json
    json['list'].forEach((i) {
      var obj = CityWeatherModel();
      obj.name = i['name'] as String?;
      obj.coordinates = "${i['coord']['lat']},${i['coord']['lon']}";
      obj.temperature = double.tryParse(i['main']['temp'].toStringAsFixed(1));
      obj.minTemperature =
          double.tryParse(i['main']['temp_min'].toStringAsFixed(1));
      obj.maxTemperature =
          double.tryParse(i['main']['temp_max'].toStringAsFixed(1));
      obj.windSpeed = double.tryParse(i['wind']['speed'].toStringAsFixed(1));
      list.add(obj);
    });

    return list;
  }
}
