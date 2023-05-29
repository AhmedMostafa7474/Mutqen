import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mutqen/data/model/profile.dart';
import 'package:mutqen/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profilerepo;
  Profile ? profile ;
  ProfileCubit(this.profilerepo) : super(ProfileInitial());

  Future <Profile?> GetProfile()
  async {
    profile = await profilerepo.Getprofile();
    if(profile != null) {
      emit(ProfileLoaded(profile));
    }
    else
      {
        emit(ProfileFailed());
      }
    return profile;
  }

  Future <void> updateProfile(String phone,String country,String city,{String image = ""})
  async {
     await profilerepo.updateProfile(phone, country, city,imagepath: image);

    emit(ProfileEdited());
    await GetProfile();
      }
}
