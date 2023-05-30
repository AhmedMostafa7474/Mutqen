part of 'uni_cubit.dart';

@immutable
abstract class UniState {}

class UniInitial extends UniState {}
class UniLoaded extends UniState {
  final List<College> univs;
  UniLoaded(this.univs);
}
