import 'package:mutqen/business/cityBloc/city_cubit.dart';
import 'package:mutqen/business/profileBloc/profile_cubit.dart';
import 'package:mutqen/data/repo/profile_repo.dart';
import 'package:mutqen/data/webservice/city_services.dart';
import 'package:mutqen/data/webservice/profile_services.dart';

import '../data/repo/city_repo.dart';

class blocGenerator{

  late cityRepo cityrepo;
  late CityCubit cityCubit;
  late ProfileRepo profilerepo;
  late ProfileCubit profileCubit;
  blocGenerator() {
    cityrepo = cityRepo(cityServices());
    cityCubit = CityCubit(cityrepo);

    profilerepo = ProfileRepo(profileServices());
    profileCubit = ProfileCubit(profilerepo);
  }
}