import 'package:george_flutter_radcom_weather/repositories/FakeWeatherRepositoryImpl.dart';
import 'package:get/get.dart';

import '../objects/city_weather_model.dart';
import '../repositories/OpenWeatherRepositoryImpl.dart';

abstract class WeatherRepository {
  Future<List<CityWeatherModel>> getCitiesWeather();
}

WeatherRepository repoImp = Get.put(OpenWeatherRepositoryImpl());
WeatherRepository getWeatherRepository() {
  return repoImp;
}
