import 'package:george_flutter_radcom_weather/objects/city_weather_model.dart';
import '../genericRepo/weather_repository.dart';

class FakeWeatherRepositoryImpl extends WeatherRepository {
  @override
  Future<List<CityWeatherModel>> getCitiesWeather() async {
    var fakeObj = CityWeatherModel(
      name: "Bucuresti",
      coordinates: "22.232323,32.323232",
      temperature: 10.2,
      maxTemperature: 15.2,
      minTemperature: 16.2,
      windSpeed: 10,
    );

    await Future.delayed(const Duration(seconds: 3));

    return [fakeObj, fakeObj];
  }
}
