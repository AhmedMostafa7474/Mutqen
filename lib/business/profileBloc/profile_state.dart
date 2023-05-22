part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoaded extends ProfileState {
  Profile? profile;
  ProfileLoaded(this.profile);
}
class ProfileFailed extends ProfileState {}