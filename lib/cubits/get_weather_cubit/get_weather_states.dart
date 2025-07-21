import 'package:weather/models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class SuccessfullyLoadedState extends WeatherStates {
  final WeatherModel weatherModel;

  SuccessfullyLoadedState({required this.weatherModel});
}

class FailureLoadesState extends WeatherStates {
  final String error;

  FailureLoadesState({required this.error});

}
