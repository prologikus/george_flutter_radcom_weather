import 'package:george_flutter_radcom_weather/genericRepo/weather_repository.dart';
import 'package:george_flutter_radcom_weather/objects/city_weather_model.dart';
import 'package:george_flutter_radcom_weather/utills.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageController extends GetxController {
  var weatherRepo = getWeatherRepository();

  RxList<CityWeatherModel> cities = RxList.empty();

  RxBool loading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();

    _getCities();
  }

  void _getCities() async {
    loading.value = true;
    try {
      cities.value = await weatherRepo.getCitiesWeather();
    } catch (e) {
      //handle errors
      simpleSnack(e.toString(), true);
    }
    loading.value = false;
  }

  void refreshPressed() {
    _getCities();
  }

  void onMapPressed(CityWeatherModel obj) async {
    //launch maps
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${obj.coordinates}';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      simpleSnack("Can't open Google Maps!", true);
    }
  }
}
