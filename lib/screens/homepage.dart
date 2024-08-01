import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/screens/no_weather_screen.dart';
import 'package:weather_app/widgets/info_weather.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.dark_mode))],
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              "Weather App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          //backgroundColor: Colors.blueAccent,
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return NoWeatherScreen();
            } else if (state is WeatherLoadedState) {
              return InfoWeather();
            } else {
              return const Text("oops there was an an error");
            }
          },
        ));
  }
}
