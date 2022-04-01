import 'package:flutter/material.dart';
import 'package:george_flutter_radcom_weather/objects/city_weather_model.dart';
import 'package:george_flutter_radcom_weather/widgets/simple_squere_button.dart';
import 'package:get/get.dart';

class PlaceWidget extends StatelessWidget {
  final VoidCallback onMapButtonPressed;
  final CityWeatherModel cityWeatherModel;

  const PlaceWidget({
    Key? key,
    required this.onMapButtonPressed,
    required this.cityWeatherModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Get.theme;

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: _theme.colorScheme.primary.withAlpha(30),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${cityWeatherModel.temperature}\u00B0",
            style: _theme.textTheme.headline4?.copyWith(fontSize: 32),
          ),
          Opacity(
            opacity: 0.8,
            child: Row(
              children: [
                Text(
                  "${cityWeatherModel.minTemperature}\u00B0",
                  style: _theme.textTheme.headline4?.copyWith(fontSize: 13),
                ),
                const RotatedBox(
                    quarterTurns: 45,
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 21,
                    )),
                const Icon(
                  Icons.circle,
                  size: 3,
                ),
                const SizedBox(width: 10),
                Text(
                  "${cityWeatherModel.maxTemperature}\u00B0",
                  style: _theme.textTheme.headline4?.copyWith(fontSize: 13),
                ),
                const RotatedBox(
                    quarterTurns: -45,
                    child: Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 21,
                    )),
                const Icon(
                  Icons.circle,
                  size: 3,
                ),
                const SizedBox(width: 10),
                Text(
                  "${cityWeatherModel.windSpeed}km/h",
                  style: _theme.textTheme.headline4?.copyWith(fontSize: 13),
                ),
                const Icon(
                  Icons.sports_score_rounded,
                  size: 21,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),

          //city
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityWeatherModel.name ?? "",
                      style: _theme.textTheme.headline4?.copyWith(fontSize: 18),
                    ),
                    Text(
                      cityWeatherModel.coordinates ?? "",
                      style: _theme.textTheme.headline4?.copyWith(
                        fontSize: 13,
                        color: _theme.colorScheme.onBackground.withAlpha(170),
                      ),
                    ),
                  ],
                ),
              ),
              SimpleSquereButton(
                icon: Icons.location_on_rounded,
                smaller: true,
                onPressed: onMapButtonPressed,
              )
            ],
          )
        ],
      ),
    );
  }
}
