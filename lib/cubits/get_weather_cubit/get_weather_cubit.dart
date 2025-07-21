import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';
import 'package:dio/dio.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
   WeatherModel? weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherServices(
        dio: Dio(),
      ).getCurrentWeather(cityName: cityName);
      emit(SuccessfullyLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(FailureLoadesState(error: e.toString()));
    }
  }
}
