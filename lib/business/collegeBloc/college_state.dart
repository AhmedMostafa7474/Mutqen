part of 'college_cubit.dart';

@immutable
abstract class CollegeState {}

class CollegeInitial extends CollegeState {}

class CollegeLoaded extends CollegeState {
  final List<College> colleges;
  CollegeLoaded(this.colleges);
}
