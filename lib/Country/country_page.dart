import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_2/Weather/weather_params.dart';
import 'package:flutter_application_2/Router/app_router.dart';
import 'package:flutter_application_2/Country/country_bloc.dart';
import 'package:flutter_application_2/Country/country_event.dart';
import 'package:flutter_application_2/Country/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchCountryPage extends StatelessWidget {
  const SearchCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CountryBloc()..add(SearchCountryEvent(nameCountry: '')),
      child: const _SearchCountryView(),
    );
  }
}

class _SearchCountryView extends StatelessWidget {
  const _SearchCountryView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SettingRoute()),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: const TextStyle(fontSize: 30),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read<CountryBloc>().add(
                          SearchCountryEvent(nameCountry: value),
                        );
                  }
                },
              ),
            ),
          ),
          BlocBuilder<CountryBloc, CountryState>(
            builder: (context, state) {
              if (state is LoadedCountryState) {
                return SliverList.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final country = state.list[index];

                    final lat = double.tryParse(country.latitude ?? '');
                    final lon = double.tryParse(country.longitude ?? '');

                    return ListTile(
                      title: Text(
                        country.name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      subtitle: Text(country.displayName),
                      onTap: (lat != null && lon != null)
                          ? () {
                              context.router.push(
                                WeatherRoute(
                                  weatherParams: WeatherParams(
                                    latitude: lat,
                                    longitude: lon,
                                    currentWeather: true,
                                  ),
                                ),
                              );
                            }
                          : null,
                    );
                  },
                );
              }

              if (state is ErrorCountryState) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                      "Error",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                );
              }

              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
        ],
      ),
    );
  }
}