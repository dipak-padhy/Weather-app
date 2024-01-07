part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchWeatherDataEvent extends HomeEvent {
  final Position position;

  FetchWeatherDataEvent({required this.position});
} // Event for fetching weather data called at main.dart file.
