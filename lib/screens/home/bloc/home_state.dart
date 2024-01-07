part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final Weather weather;

  HomeLoadingSuccessState({required this.weather});
}

class HomeLoadingErrorState extends HomeState {}
