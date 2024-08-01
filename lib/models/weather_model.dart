
class WeatherModel {
  String? cityName;
  String? updatedDate;
  double? maxTemp;
  double? minTemp;
  double? avgTemp;
  String? tempStatus;
  String? image;

  WeatherModel(
      {this.avgTemp,
      this.cityName,
      this.image,
      this.maxTemp,
      this.minTemp,
      this.tempStatus,
      this.updatedDate});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      updatedDate: json["current"]["last_updated"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      tempStatus: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
    );
  }
}
