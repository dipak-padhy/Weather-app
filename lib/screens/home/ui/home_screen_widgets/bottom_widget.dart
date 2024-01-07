// Includes 4 containers showcasing today's wind speed,pressure,cloudiness,humidity data.

import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/bloc/home_bloc.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key, required this.state});

  final HomeLoadingSuccessState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Today's Wind Speed is :- ${state.weather.windSpeed} m/s"),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                    elevation: 24,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))));
              },
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/wind-speed.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Wind",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    Text("${state.weather.windSpeed.toString()} m/s",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white60,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Today's Wind Pressure is :- ${state.weather.pressure} pa"),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                    elevation: 24,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))));
              },
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/speedometer_8138463.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Pressure",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    Text("${state.weather.pressure.toString()} pa",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white60,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Today's Clouds Mapped in Okta's Scale is :- ${state.weather.cloudiness} %"),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                    elevation: 24,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))));
              },
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/clouds.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Clouds",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    Text("${state.weather.cloudiness!.toInt()}%",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white60,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Today's Humidity is :- ${state.weather.humidity} %"),
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    behavior: SnackBarBehavior.floating,
                    elevation: 24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )));
              },
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/water_756433.png",
                      scale: 10,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Humidity",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                    Text("${state.weather.humidity!.toInt()}%",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white60,
                            fontWeight: FontWeight.w700))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
