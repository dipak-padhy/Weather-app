import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/screens/home/data/essential_key/essential_key.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchWeatherDataEvent>(fetchWeatherDataEvent);
  }

  FutureOr<void> fetchWeatherDataEvent(
      FetchWeatherDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState()); //emitting loading state.
    try {
      WeatherFactory dataRequest =
          WeatherFactory(API_KEY, language: Language.ENGLISH); //plugin for fetching weather data in json.
      Weather weather = await dataRequest.currentWeatherByLocation(
          event.position.latitude, event.position.longitude); //A variable of class Weather for storing a weather-query response from OpenWeatherMap Api.
      emit(HomeLoadingSuccessState(weather: weather)); //emitting success state.
    } catch (e) {
      emit(HomeLoadingErrorState()); //emitting error state.
    }
  }
}
