class CityWeatherModel {
  String? name;
  String? coordinates; // lat,long
  double? temperature;
  double? maxTemperature;
  double? minTemperature;
  double? windSpeed;

  CityWeatherModel({
    this.name,
    this.coordinates,
    this.temperature,
    this.maxTemperature,
    this.minTemperature,
    this.windSpeed,
  });
}
