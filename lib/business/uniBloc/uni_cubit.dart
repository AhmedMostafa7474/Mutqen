import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/model/college.dart';
import '../../data/repo/collegerepo.dart';
import '../collegeBloc/college_cubit.dart';

part 'uni_state.dart';

class UniCubit extends Cubit<UniState> {
  final collegeRepo collegerepo;
  List<College> univs = [];
  UniCubit(this.collegerepo) : super(UniInitial());
  Future <List<College>> GetUnives()
  async {
    emit(UniInitial());
    univs = await collegerepo.GetUniv();
    emit(UniLoaded(univs));
    return univs;
  }
}
