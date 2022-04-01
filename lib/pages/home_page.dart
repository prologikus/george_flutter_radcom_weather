import 'package:flutter/services.dart';
import 'package:george_flutter_radcom_weather/widgets/simple_squere_button.dart';

import '../controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/place_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final HomePageController controller = Get.put(HomePageController());
    var _theme = context.theme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Container(
        color: _theme.colorScheme.background,
        child: SafeArea(
          child: Column(
            children: [
              //app bar
              Container(
                height: 65,
                color: _theme.colorScheme.background,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "app_title".tr,
                      style: _theme.textTheme.headline3?.copyWith(fontSize: 21),
                    ),
                    SimpleSquereButton(
                      icon: Icons.refresh_rounded,
                      smaller: true,
                      onPressed: () {
                        controller.refreshPressed();
                      },
                    ),
                  ],
                ),
              ),

              //main list
              Obx(() => Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.cities.length,
                        itemBuilder: (a, index) {
                          var obj = controller.cities[index];
                          return PlaceWidget(
                            onMapButtonPressed: () {
                              controller.onMapPressed(obj);
                            },
                            cityWeatherModel: obj,
                          );
                        }),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
