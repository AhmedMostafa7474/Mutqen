part of 'city_cubit.dart';

@immutable
abstract class CityState {}

class CityInitial extends CityState {}

class CityLoaded extends CityState {
  final List<City> cities;
  CityLoaded(this.cities);
}
