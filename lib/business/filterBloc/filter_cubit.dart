import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class FilterCubit extends Cubit<List<String>> {
  FilterCubit() : super([]);

  void clear()
  {
    state.clear();
    emit(state);

  }
  void add(String value) {
    state.add(value);
    emit(state);
  }

    void delete(String value) {
      state.remove(value);
      emit(state);
    }
  }

