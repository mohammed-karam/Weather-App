import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c0cab646a96d4ea18d8195833251507';

  WeatherServices({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      final response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel dayWeather = WeatherModel.fromJson(response.data);

      return dayWeather;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error try later');
    }
  }
}
