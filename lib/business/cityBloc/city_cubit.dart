import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/city.dart';
import '../../data/repo/city_repo.dart';

part 'city_state.dart';

class CityCubit extends Cubit<CityState> {
  final cityRepo cityrepo;
  List<City> cities = [];
  CityCubit(this.cityrepo) : super(CityInitial());
  Future <List<City>> GetCites(country)
  async {
    cities = await cityrepo.GetCities(country);
    emit(CityLoaded(cities));
    return cities;
  }
}
