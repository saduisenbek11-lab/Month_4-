import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Setting/setting_page.dart';
import 'package:flutter_application_2/Weather/weather_page.dart';
import 'package:flutter_application_2/Weather/weather_params.dart';
import 'package:flutter_application_2/Country/country_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
     AutoRoute(page: SearchContryRoute.page , initial: true),
     AutoRoute(page: WeatherRoute.page),
     AutoRoute(page: SettingRoute.page),
  ];
}