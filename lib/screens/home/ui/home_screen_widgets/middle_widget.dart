import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/screens/home/bloc/home_bloc.dart';

class MiddleWidget extends StatefulWidget {
  const MiddleWidget({super.key, required this.state});

  final HomeLoadingSuccessState state;

  @override
  State<MiddleWidget> createState() => _MiddleWidgetState();
}

class _MiddleWidgetState extends State<MiddleWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "${widget.state.weather.temperature!.celsius!.round()}°C",
            style: const TextStyle(
                fontSize: 52, color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            widget.state.weather.weatherMain!.toUpperCase(),
            style: const TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Center(
          child: Text(
            DateFormat('EEEE dd \u2981')
                .add_jm()
                .format(widget.state.weather.date!),
            style: const TextStyle(
                //fontSize: 12,
                color: Colors.white54,
                fontWeight: FontWeight.w300),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/sunrise.png",
                  scale: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sunrise",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      DateFormat()
                          .add_jm()
                          .format(widget.state.weather.sunrise!),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/sunset.png",
                  scale: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sunset",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      DateFormat()
                          .add_jm()
                          .format(widget.state.weather.sunset!),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: Divider(
            color: Colors.white30,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/temp-max.png",
                  scale: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "High",
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white60,
                          fontWeight: FontWeight.w300),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${widget.state.weather.tempMax!.celsius!.ceil()} °C",
                      //   "38°C",
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/temp-min.png",
                    scale: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Low",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white60,
                            fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "${widget.state.weather.tempMin!.celsius!.floor()} °C",
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Includes current temperature,weather description,date & time,and other details like(sunrise,sunset,high temp.,low temp.).
