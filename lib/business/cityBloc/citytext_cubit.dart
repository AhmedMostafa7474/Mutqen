import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class CitytextCubit extends Cubit<String> {
  CitytextCubit() : super("");
  void add(String value) {
    emit(value);
  }
}
