// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [SearchContryPage]
class SearchContryRoute extends PageRouteInfo<void> {
  const SearchContryRoute({List<PageRouteInfo>? children})
      : super(SearchContryRoute.name, initialChildren: children);

  static const String name = 'SearchContryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchContryPage();
    },
  );
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingPage();
    },
  );
}

/// generated route for
/// [WeatherPage]
class WeatherRoute extends PageRouteInfo<WeatherRouteArgs> {
  WeatherRoute({
    Key? key,
    required WeatherParams weatherParams,
    List<PageRouteInfo>? children,
  }) : super(
          WeatherRoute.name,
          args: WeatherRouteArgs(key: key, weatherParams: weatherParams),
          initialChildren: children,
        );

  static const String name = 'WeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherRouteArgs>();
      return WeatherPage(key: args.key, weatherParams: args.weatherParams);
    },
  );
}

class WeatherRouteArgs {
  const WeatherRouteArgs({this.key, required this.weatherParams});

  final Key? key;

  final WeatherParams weatherParams;

  @override
  String toString() {
    return 'WeatherRouteArgs{key: $key, weatherParams: $weatherParams}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeatherRouteArgs) return false;
    return key == other.key && weatherParams == other.weatherParams;
  }

  @override
  int get hashCode => key.hashCode ^ weatherParams.hashCode;
}
