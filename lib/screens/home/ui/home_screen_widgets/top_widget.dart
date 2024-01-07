import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/bloc/home_bloc.dart';

class TopWidget extends StatefulWidget {
  const TopWidget({super.key, required this.state});

  final HomeLoadingSuccessState state;

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  String firstGreetingOfDay = "Good Morning";
  String secondGreetingOfDay = "Good Afternoon";
  String thirdGreetingOfDay = "Good Evening";
  String lastGreetingOfDay = "Good Night";
  String errorGettingGreetingOfDay = "Error in returning greetings";

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset("assets/images/thunderstorm.png");
      case >= 300 && < 400:
        return Image.asset("assets/images/light-rain.png");
      case >= 500 && < 600:
        return Image.asset("assets/images/heavy-rain.png");
      case >= 600 && < 700:
        return Image.asset("assets/images/snowfall.png");
      case >= 700 && < 800:
        return Image.asset("assets/images/haze.png");
      case == 800:
        return Image.asset("assets/images/sunny.png");
      case > 800 && <= 804:
        return Image.asset("assets/images/broken-clouds.png");
      default:
        return Image.asset("assets/images/broken-clouds.png");
    }
  } //method to get image of current weather condition based on weather description data from api.

  String getGreetings(int hour) {
    switch (hour) {
      case >= 5 && < 12: // 5 am to 12 pm
        return firstGreetingOfDay;
      case >= 12 && < 16: // 12 pm to 4 pm
        return secondGreetingOfDay;
      case >= 16 && <= 18: // 4pm to 6pm
        return thirdGreetingOfDay;
      case > 18 || <= 4: // 6pm to 4 am
        return lastGreetingOfDay;
      default:
        return errorGettingGreetingOfDay;
    }
  } //method to get greeting according to current time.

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📍${widget.state.weather.areaName}",
          style: const TextStyle(
              color: Colors.white54, fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          getGreetings(DateTime.now().hour),
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
        ),
        getWeatherIcon(widget.state.weather.weatherConditionCode!),
      ],
    );
  }
}

//Includes current location,greetings and current weather condition.
