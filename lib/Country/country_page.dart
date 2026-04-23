import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Weather/weather_params.dart';
import 'package:flutter_application_2/Router/app_router.dart';
import 'package:flutter_application_2/Country/country_bloc.dart';
import 'package:flutter_application_2/Country/country_event.dart';
import 'package:flutter_application_2/Country/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
@RoutePage()

class SearchContryPage extends StatefulWidget{
  const SearchContryPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _SearchContryPageState();
}
class _SearchContryPageState extends State<SearchContryPage>{
  final CountryBloc _countryBloc = CountryBloc();
  
  @override
 void initState(){
 _countryBloc.add(SearchContryEvent(nameCountry: ''));
 super.initState();
 }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.router.push(const SettingRoute()),
            icon: const Icon(Icons.settings),
          )
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
                    _countryBloc.add(SearchContryEvent(nameCountry: value));
                  }
                },
              ),
            ),
          ),
          BlocBuilder<CountryBloc, CountryState>(
            bloc: _countryBloc,
            builder: (context, state) {
              if (state is LoadedCountryState) {
                return SliverList.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final country = state.list[index];
                    return ListTile(
                      title: Text(country.name, style: const TextStyle(fontSize: 25)),
                      subtitle: Text(country.displayName),
                      onTap: () {
                        final double lat = double.parse(country.latitude);
                        final double lon = double.parse(country.longitude);
                        context.router.push(
                          WeatherRoute(
                            weatherParams: WeatherParams(
                              latitude: lat,
                              longitude: lon,
                              currentWeather: true,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
              if (state is ErrorCountryState) {
                return const SliverToBoxAdapter(
                  child: Center(child: Text("Error", style: TextStyle(fontSize: 30))),
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
 /*
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            context.router.push(SettingRoute());
          }, icon: Icon(Icons.settings))
        ],
      ),
     body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TextField(
          style: TextStyle(fontSize: 50),
          onChanged: (value){
        _countryBloc.add(SearchContryEvent(nameCountry: 'value'));
       BlocBuilder(
        bloc: _countryBloc,
        builder: (context , state) {
          if (state is LoadedCountryState){
            return SliverList.builder(
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                onTap: () {
                 final double lat = double.parse(state.list[index].lat);
                 final double lon = double.parse(state.list[index].lon);
                 context.router.push(
                  WeatherRoute(
                  weatherParams: WeatherParams(
                    latitude: lat,
                     longitude: lon, 
                     currentWeather: true,
                     )));
                },
                child:  Column(
                  children: [
                    Text("${state.list[index].name}",style: TextStyle(fontSize: 30),),
                    SizedBox(height: 10),
                    Text("${state.list[index].displayName}",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20),
                  ],
                ),
                );
              },
            );
          }
          if (state is ErrorCountryState){
            return SliverToBoxAdapter (child :Text("Error",style: TextStyle(fontSize: 50,),));
          }
          return  SliverToBoxAdapter (child :Center(child: CircularProgressIndicator(),));
        }
         );
          },
          ),
          )
      ]
     )
    );
  }
} 
*/