import 'package:mutqen/business/cityBloc/city_cubit.dart';
import 'package:mutqen/data/webservice/city_services.dart';

import '../data/repo/city_repo.dart';

class blocGenerator{

  late cityRepo cityrepo;
  late CityCubit cityCubit;
  blocGenerator() {
    cityrepo = cityRepo(cityServices());
    cityCubit = CityCubit(cityrepo);
  }
}