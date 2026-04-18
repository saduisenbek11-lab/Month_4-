import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'weather_params.dart';
class WeatherPage extends StatefulWidget{
  const WeatherPage({super.key});
  
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}
class _WeatherPageState extends State<WeatherPage>{
  final WeatherBloc _weatherBloc = WeatherBloc();
    @override
void initState() {
  super.initState();
  _weatherBloc.add(
    LoadedWeatherEvent(
      params: WeatherParams( 
        currentWeather: true,
        latitude: 42.87,
        longitude: 74.59,
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Температура в Бишкеке",style: TextStyle(fontSize: 30,color: Colors.amber[800]),),
      ),
      body: Center(
    child: BlocBuilder<WeatherBloc , WeatherState>(
      bloc: _weatherBloc,
      builder: (context, state) {
        if(state is LoadingWeatherState){
        return CircularProgressIndicator();
        }
        if (state is LoadedWeatherImageState){
          return Text(
          "${state.weatherModel.tem.temperature} ${state.weatherModel.temUnit.temperature}",
          style: TextStyle(fontSize: 50),
          );
        }
        if (state is ErrorWeaterState){
          return Text("Ошибка",
          style: TextStyle(fontSize: 10,color: Colors.green),
          );
        }
        return Text("Nothin");
      }
      ),
    )
    );
  }

}