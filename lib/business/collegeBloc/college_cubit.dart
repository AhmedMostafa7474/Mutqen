import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mutqen/data/model/college.dart';
import 'package:mutqen/data/repo/collegerepo.dart';

part 'college_state.dart';

class CollegeCubit extends Cubit<CollegeState> {
  final collegeRepo collegerepo;
  List<College> colleges = [];
  CollegeCubit(this.collegerepo) : super(CollegeInitial());
  Future <List<College>> GetColleges(uni)
  async {
    emit(CollegeInitial());
    colleges = await collegerepo.GetColleges(uni);
    emit(CollegeLoaded(colleges));
    return colleges;
  }
}
