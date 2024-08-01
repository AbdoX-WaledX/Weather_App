import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Dio dio = Dio();

  Future<WeatherModel> getweather({required String city}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/forecast.json?key=f86173e44e51404d80b211607242707&q=$city");

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data["error"]["message"] ??
          "oops there was an error try later";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("oops there was an error try later");
    }
  }
}
